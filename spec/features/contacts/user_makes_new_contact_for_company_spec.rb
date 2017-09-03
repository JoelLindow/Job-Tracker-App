require 'rails_helper'

describe "User creates a new contact" do
  scenario "a user can see a contact for a company" do
    company = Company.create!(name: "Company_1")
    contact = company.contacts.create!(name: "Contact_name_1", title: "Contact_title_1", email: "contact_1@company.com")

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Company_1")
    expect(page).to have_content("Contact_name_1")
    expect(page).to have_content("Contact_title_1")
    expect(page).to have_content("contact_1@company.com")

    expect(company.contacts.count).to eq(1)
  end

  scenario "a user can create a new contact for a company" do
    company = Company.create!(name: "Company_1")

    visit company_path(company)

    fill_in "contact[name]", with: "Contact_name_1"
    fill_in "contact[title]", with: "Contact_title_1"
    fill_in "contact[email]", with: "Contact_1@company.com"
    click_button "Create Contact"

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    
    expect(page).to have_content("Contact_name_1")
    expect(page).to have_content("Contact_title_1")
    expect(page).to have_content("Contact_1@company.com")
    expect(company.contacts.count).to eq(1)
  end
end
