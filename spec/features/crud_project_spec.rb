require "rails_helper"

RSpec.feature "CRUD project", :type => :feature do
  scenario "User creates a new project" do
    visit "/projects"

    click_button "New Project"
    fill_in "Project title", :with => "My Project"
    fill_in "Project description", :with => "My Project Description"
    click_button "Create Project"

    expect(page).to have_text("Project was successfully created.")
  end

  scenario "User selects a single project" do
    visit "/projects"

    click_link "link_to_project"

    expect(page).to have_text("Members")
  end
end
