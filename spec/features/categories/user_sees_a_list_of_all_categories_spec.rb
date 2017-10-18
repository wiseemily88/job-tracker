require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_1 = Category.create!(title: "Web Development")
    category_2 = Category.create!(title: "Finance")
    category_3 = Category.create!(title: "Marketing")
    category_4 = Category.create!(title: "Communications")


    visit categories_path

    expect(page).to have_content("Web Development")
    expect(page).to have_content("Finance")
    expect(page).to have_content("Marketing")
    expect(page).to have_content("Communications")

  end

end
