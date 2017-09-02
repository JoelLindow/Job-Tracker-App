require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can not create a category of the same name" do
    Category.create!(title: "Category_1")
    Category.create!(title: "Category_2")
    Category.create!(title: "Category_3")

    visit categories_path

    expect(current_path).to eq("/categories")
    expect(page).to have_content("Category_1")
    expect(page).to have_content("Category_2")
    expect(page).to have_content("Category_3")

  end
end
