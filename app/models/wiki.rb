class Wiki < ApplicationRecord
  has_many :wikis
  has_many :collaborators
  belongs_to :user
  scope :published, -> { where(private: false) }
end
