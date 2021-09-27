class Bug < ApplicationRecord
  belongs_to :user
  enum statut: %i[pending on_schedule completed]
  validates :content, presence: true
  validates :title, presence: true

  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "100x100"
  end

  #has_rich_text :content
end
