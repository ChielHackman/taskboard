require "rails_helper"

RSpec.feature "Project Features", :type => :feature do
  context 'create new project' do
    before(:each) do
      visit '/projects/new'
        fill_in 'project_title', with: 'My Project'
    end

    scenario "should be successful" do
      fill_in 'project_description', with: 'My Project Description'

      click_button 'Create Project'
      expect(page).to have_content 'Project was successfully created.'
    end

    scenario "should fail" do
      click_button 'Create Project'
      expect(page).to have_content 'Please provide a description for your project.'
    end
  end

  context 'updates a project' do
    scenario "should be successful" do
      project = Project.create(title: "My awesome project", description: "Testing with RSpec and Capybara")
      visit edit_project_path(project)
      fill_in 'project_title', with: 'Changed title'
      fill_in 'project_description', with: 'Changed description'

      click_button 'Update Project'
      expect(page).to have_content 'Project was successfully updated.'
      expect(page).to have_content 'Changed title'
    end

    scenario "should fail" do
      project = Project.create(title: "My awesome project", description: "Testing with RSpec and Capybara")
      visit edit_project_path(project)
      fill_in 'project_title', with: ''

      click_button 'Update Project'
      expect(page).to have_content 'Please provide a title for your project'
    end
  end

  context 'destroy project' do
    scenario "should be successful" do
      project = Project.create(title: "My awesome project", description: "Testing with RSpec and Capybara")
      visit project_path(project)
      expect { click_link 'Delete Project' }.to change(Project, :count).by(-1)

      expect(page).to have_content 'Project was successfully deleted.'
    end
  end
end
