class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments


  # def self.level_of_interest_stats
  #   (Job.all.group_by(&:level_of_interest))
  # end
end
