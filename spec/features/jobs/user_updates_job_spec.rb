require 'rails_helper'

describe "User can edit an existing job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Marketing Analyst"

    click_button "Create"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Marketing Analyst")
    expect(page).to_not have_content("Developer")

  end
end
