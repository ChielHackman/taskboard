require "rails_helper"

RSpec.feature "CRUD project", :type => :feature do
  scenario "User creates a new project" do
    visit "/projects"

    click_button "New Project"
    fill_in("project_title", :with => "My Project")
    fill_in("project_description", :with => "My Project Description")
    within('#newProjectModal') do
      click_button('Create Project', wait: 5) #wait for it..
    end

   #NOTE:
   #REMOVE ME TO CONTINUE ==============================
   puts "BEFORE: 👁 " + body + " 👁"
   expect(page).to have_selector ".alert", text: "Project was successfully created."
   puts "AFTER: 👁 " + body + " 👁"
  # element we are looking for is:
  # <div class="alert alert-success">Project was successfully created.</div>
  # ⚠️ As you can see in your console...its not there and wil never be found with capybara only... because its being injected with javascript. thats where the Selenium Driver, Poldergeist or PhantomJS works out well i think.....
  #REMOVE ME END ==============================

  end

  scenario "User selects a single project" do
    visit "/projects"

    click_link "link_to_project"

    expect(page).to have_text("Members")
  end
end
