class Room < ApplicationRecord
  belongs_to :user
  belongs_to :classroom

  validates :body, presence: true

  
end
