class Bug < ApplicationRecord
  belongs_to :user
  enum statut: %i[pending on_schedule completed]
  has_rich_text :content
end
