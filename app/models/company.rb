class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts


  def self.top_companies_by_level_of_interest
    select('companies.name, avg(jobs.level_of_interest) AS average')
    .joins(:jobs)
    .group('companies.name')
    .order('avg(jobs.level_of_interest) desc')
    .first(3)
  end
end
