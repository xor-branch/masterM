class Classroom < ApplicationRecord
  belongs_to :user
  has_many :courses, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  accepts_nested_attributes_for :courses, reject_if: :all_blank
  enum category: %i[default digital business arts artisanat soft_skil language]

  validates :title, presence: true
  validates :description, presence: true
  validates :cover, presence: true

end
