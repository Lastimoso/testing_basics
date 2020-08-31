require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @user = users(:one)
    login_as @user
  end

  test "#index should be a success" do
    get projects_url
    assert_response :success
  end

  test "#show should be a success" do
    get project_url(@project.id)
    assert_response :success
  end

  test "#create should be a success" do
    assert_difference("Project.count", 1) do
      post projects_url, params: {
        project: {
          name: "Brand New",
          description: "This description has more than 10 chars",
          due_date: "2020-10-20"
        }
      }
    end
  end

  test "#create should render validation errors" do
    assert_no_difference("Project.count") do
      post projects_url, params: {
        project: {
          name: "",
          description: "This description has more than 10 chars",
          due_date: "2020-10-20"
        }
      }
    end
  end
end
