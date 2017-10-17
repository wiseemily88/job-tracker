require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Web Development")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    visit company_jobs_path(company)

    within(".jobs") do
      click_link "Delete"
    end

    expect(page).to have_content("Developer was successfully deleted!")
  end
end
