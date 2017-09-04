class AnalysisController < ApplicationController
  def index
    if params[:sort] == "location"
      @jobs = Job.order(:city)
      @title = "City"
    elsif params[:sort] == "interest"
      @jobs = Job.order(:level_of_interest)
      @title = "Level of Interest"
    end
  end
end
