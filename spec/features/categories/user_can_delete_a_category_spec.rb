require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category = Category.create(title: "Marketing")
    visit categories_path

    within(".category") do
      click_link "Delete"
    end

    expect(page).to have_content("Marketing was successfully deleted!")
  end
end
