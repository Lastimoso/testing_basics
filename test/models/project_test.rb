require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @admin = users(:one)
    @user = User.last
    @project = projects(:one)
    @project2 = Project.last
  end

  test "should be invalid without name" do
    @project.name = nil
    assert_not @project.valid?
  end

  test "should be invalid if name is shorter than 3 chars" do
    @project.name = "ge"
    assert_not @project.valid?
  end

  test ".due_today" do
    assert_includes Project.due_today, @project
  end

  test ".over_due" do
    assert_includes Project.over_due, projects(:two)
  end
end
