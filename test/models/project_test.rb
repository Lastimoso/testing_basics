require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = Project.new(
      name: "123",
      description: "1234567890",
      due_date: "2020-02-01"
    )
  end

  test "should be invalid without name" do
    @project.name = nil
    assert_not @project.valid?
  end

  test "should be invalid if name is shorter than 3 chars" do
    @project.name = "ge"
    assert_invalid @project, name: :too_short
  end

  test ".due_today" do
    assert_includes Project.due_today, projects(:due)
    assert_not_includes Project.due_today, projects(:over_due)
  end

  test ".due_today does not include projects before due date" do
    before_due_date_project = projects(:due)
    before_due_date_project.update!(due_date: 1.day.from_now)

    assert_not_includes Project.due_today, before_due_date_project
  end

  test ".over_due" do
    assert_includes Project.over_due, projects(:over_due)
    assert_not_includes Project.over_due, projects(:due)
  end

  test "structure" do
    # setup
    # excercise
    # asserts/expectations
    # teardown
  end
end
