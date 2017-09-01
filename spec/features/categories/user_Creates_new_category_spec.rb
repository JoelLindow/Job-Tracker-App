require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Education"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Education")
    expect(Category.count).to eq(1)
  end

  scenario "a user can not create a category of the same name" do
    Category.create!(title: "Education")

    visit new_category_path

    fill_in "category[title]", with: "Education"
    click_button "Create"

    expect(current_path).to eq("/categories/new")
    expect(page).to have_content("Education already exists")
    expect(Category.count).to eq(1)
  end
end
