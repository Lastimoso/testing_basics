class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update]

  def index
    @projects = Project.all
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to projects_path(anchor: "project_#{@project.id}"), notice: "Projecto creado exitosamente"
    else
      @projects = @projects = Project.all
      render :index
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :due_date)
  end
end
