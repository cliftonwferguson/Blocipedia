class Wiki < ApplicationRecord
  has_many :wikis :collaborators
  belongs_to :user
  scope :published, -> { where(private: false) }
end
