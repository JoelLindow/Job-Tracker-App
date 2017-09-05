class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  scope :by_interest, -> { all.group_by(&:level_of_interest) }

  scope :top_three_companies, -> { all.group(:company).order("average_level_of_interest desc").average(:level_of_interest).take(3) }

  scope :job_count_by_city, -> { all.group_by(&:city).sort }
end
