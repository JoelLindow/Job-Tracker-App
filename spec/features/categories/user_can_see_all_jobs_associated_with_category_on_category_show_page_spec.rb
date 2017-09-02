require 'rails_helper'

describe "User views job show page" do
  scenario "user sees all jobs associated with " do
    category = Category.create!(title: "Category_1")
    company_1 = Company.create!(name: "Company_1")
    job_1 = Job.create!(title: "Job_1", description: "This is job number one", level_of_interest: 20, city: "City_1", company_id: company_1.id, category_id: category.id)
    company_2 = Company.create!(name: "Company_2")
    job_2 = Job.create!(title: "Job_2", description: "This is job number one", level_of_interest: 30, city: "City_2", company_id: company_2.id, category_id: category.id)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Job_1")
    expect(page).to have_content("Job_2")

  end
end
