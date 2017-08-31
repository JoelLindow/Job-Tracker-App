require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = Company.create!(name: "ESPN")
    job   = company.jobs.create!(title: "Anchor", description: "Big Talker", city: "Tulsa", level_of_interest: 75)

    visit company_path(company)

    within(".job_#{job.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Anchor was successfully deleted!")

    expect(page).to_not have_content("Big Talker")
    expect(page).to_not have_content("Tulsa")

  end
end
