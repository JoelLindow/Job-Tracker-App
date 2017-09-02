require 'rails_helper'

describe "User edite an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Media")
    visit edit_category_path(category)

    fill_in "category[title]", with: "Fake News"
    click_button "Update"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Fake News")
    expect(page).to_not have_content("Media")
  end
end
