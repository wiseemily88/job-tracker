require 'rails_helper'

describe "User can edit an existing job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Web Development")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Marketing Analyst"

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Marketing Analyst")
    expect(page).to_not have_content("Developer")

  end
end
