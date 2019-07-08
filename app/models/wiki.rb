class Wiki < ApplicationRecord
  belongs_to :user
  scope :published, -> { where(private: false) }
end
