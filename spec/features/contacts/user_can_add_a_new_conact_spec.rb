require 'rails_helper'

describe "User creates a new contact" do
  it "a user can create a new contact" do
    company = Company.create!(name: "ESPN")

    visit new_company_contact_path(company)

      fill_in "contact[full_name]", with: "Emily"
      fill_in "contact[position]", with: "The Boss"
      fill_in "contact[email]", with: "wise@gmail.com"


    click_button "Submit"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Emily")
    expect(page).to have_content("The Boss")
    expect(page).to have_content("wise@gmail.com")

  end
end
