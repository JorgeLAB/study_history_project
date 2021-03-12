class StudyItem < ApplicationRecord

  def html_title
    "#{category.name} - #{title}"
  end
end
