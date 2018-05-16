require "rails_helper"

RSpec.feature "Task Features", :type => :feature do
  context 'create new task' do
    before(:each) do
      project = Project.create(title: 'My awesome project', description: 'Awesome description')
      visit project_path(project)
    end

    scenario "should be successful" do
      fill_in "task_title", with: "New task"

      click_button "Add Task"

      expect(page).to have_content "New task"
    end

    scenario "should fail" do

      click_button "Add Task"

      expect(page).to have_content "Something went wrong. Please try again later."
    end
  end
end
