require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  # visit "/projects"

  # fill_in "project_name", with: "New Project"
  # fill_in "project_description", with: "The best project ever"
  # select("2020", from: "project_due_date_1i")
  # select("July", from: "project_due_date_2i")
  # select("20", from: "project_due_date_3i")

  # click_on "Create Project"



  test "Complete project flow" do
    login_as users(:admin)
    visit "/projects"

    fill_in "project_name", with: "New project Name"
    fill_in "project_description", with: "My magnific project description"
    select("2020", from: "project_due_date_1i")
    select("July", from: "project_due_date_2i")
    select("20", from: "project_due_date_3i")

    click_on "Create Project"

    # assert page.assert_text("My magnific project description")

    assert_selector "td", text: "My magnific project description"
    find('td', text: "New project Name").click

    assert_equal project_path(Project.last), page.current_path
    click_on "Editar"

    fill_in "project_name", with: "Cambiadito"
    click_on "Update Project"

    assert_selector "h1", text: "Cambiadito"
    click_on "Volver al listado"

    assert_equal projects_path, page.current_path
  end
end
