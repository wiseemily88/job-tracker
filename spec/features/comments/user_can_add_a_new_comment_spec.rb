require 'rails_helper'

describe "User creates a new comment" do
  it "a user can create a new comment" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "Web Development")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "The Hiring manager was great!"
    click_button "Submit"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Hiring manager")
    expect(Comment.count).to eq(1)
  end
end
