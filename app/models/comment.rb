class Comment < ApplicationRecord
  belongs_to :job

  def format_date
    created_at.strftime(format='%m/%d/%Y')
  end

end
