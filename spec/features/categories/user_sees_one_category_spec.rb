require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create!(title: "Web Development")


    visit category_path(category)

    expect(current_path).to eq(category_path(category))
    expect(page).to have_content("Web Development")

  end

  scenario "a user sees a category they see all jobs associated" do
    category = Category.create!(title: "Web Development")
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category: category)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category: category)


    visit category_path(category)

    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")

  end
end
