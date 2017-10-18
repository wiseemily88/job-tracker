class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments


  def self.by_level_of_interest
    group(:level_of_interest)
    .count
  end
end
