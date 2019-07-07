class Wiki < ApplicationRecord
  belongs_to :user
  default_scope { where(published: true) }
  scope :published, -> { where(published: true) }
end
