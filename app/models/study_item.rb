class StudyItem < ApplicationRecord

  validates :title, presence: true
  validates :description, presence: true

  def html_title
    "#{category} - #{title}"
  end
end
