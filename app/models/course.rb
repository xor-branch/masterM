class Course < ApplicationRecord
  belongs_to :classroom
  validates :title, presence: true
  validates :content, presence: true

end
