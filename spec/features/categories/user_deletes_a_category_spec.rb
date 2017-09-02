require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    category = Category.create(title: "Category_1")

    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Category_1 was successfully deleted!")
  end
end
