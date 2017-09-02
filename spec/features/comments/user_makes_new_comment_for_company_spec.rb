require 'rails_helper'

describe "User creates a new comment" do
  scenario "a user can create a new comment for a job" do
    company = Company.create!(name: "Company_1")
    job = company.jobs.create!(title: "Job_1", level_of_interest: 10, city: "City_1")

    visit company_job_path(company, job)

    fill_in "comment[content]", with: "This is a comment"
    click_button "Create"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("This is a comment")
    expect(job.comments.count).to eq(1)
  end
end
