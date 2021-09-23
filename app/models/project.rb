class Project < ApplicationRecord
  belongs_to :user
  enum statut: %i[not_started doing done]
  has_rich_text :description
end
