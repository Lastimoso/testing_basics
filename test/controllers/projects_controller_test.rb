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

  test "sho"

end
