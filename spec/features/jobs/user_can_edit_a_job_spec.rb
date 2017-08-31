require 'rails_helper'

describe "User visits edit page for an existing job" do
  scenario "a user edits a job" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "Curling Anchor", description: "Tons of riveting ice brooming action", level_of_interest: 10, city: "NorthPort")

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Curling Broadcaster"
    fill_in "job[description]", with: "Commentary on professional ice sweeping"
    fill_in "job[level_of_interest]", with: 15
    fill_in "job[city]", with: "Juno"
    click_on "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Curling Broadcaster")
    expect(page).to have_content("Commentary on professional ice sweeping")
    expect(page).to have_content(15)
    expect(page).to_not have_content("Curling Anchor")
    expect(page).to_not have_content("Tons of riveting ice brooming action")
    expect(page).to_not have_content(10)

  end
end
