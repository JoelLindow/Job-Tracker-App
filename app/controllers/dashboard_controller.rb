class DashboardController < ApplicationController

  def index
    @jobs_by_interest = Job.by_interest
    @jobs_top_3 = Job.top_three_companies
    @jobs_by_city = Job.job_count_by_city
  end

end
