require 'rails_helper'

describe "User creates a new comment" do
  it "a user can create a new comment" do
    visit company_job_path

    fill_in "category[content]", with: "The Hiring manager was great!"
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path)
    expect(page).to have_content("Hiring manager")
    expect(Comment.count).to eq(1)
  end
end
