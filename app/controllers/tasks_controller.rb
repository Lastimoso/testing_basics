class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update]

  # /projects/:project_id/tasks
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    if @task.save
      redirect_to project_path(@project), notice: "Tarea creada exitosamente"
    else
      render "projects/index"
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to project_path(@task.project), notice: "Tarea actualizada exitosamente"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@task.project), notice: "Tarea eliminada exitosamente"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :fulfilled)
  end
end
