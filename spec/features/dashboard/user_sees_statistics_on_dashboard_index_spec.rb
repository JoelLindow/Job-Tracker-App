require 'rails_helper'

describe "User visits dashboard index" do
  scenario "a user can see a count of jobs by level of interest" do
    company = Company.create!(name: "Company_1")
    job_1 = company.jobs.create!(title: "Job_1", description: "Description_1", level_of_interest: 10, city: "City_1")
    job_2 = company.jobs.create!(title: "Job_2", description: "Description_2", level_of_interest: 30, city: "City_2")
    job_3 = company.jobs.create!(title: "Job_3", description: "Description_3", level_of_interest: 10, city: "City_1")
    job_4 = company.jobs.create!(title: "Job_4", description: "Description_4", level_of_interest: 30, city: "City_2")

    visit '/dashboard'

    expect(page).to have_content("Tracking 2 Jobs with a Level 10 interest.")
    expect(page).to have_content("Tracking 2 Jobs with a Level 30 interest.")
  end
end
