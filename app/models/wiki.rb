class Wiki < ApplicationRecord
  belongs_to :user
  default_scope { where(private: true) }
end
