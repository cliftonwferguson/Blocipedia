class Collaborators < ApplicationRecord
	belongs_to :wikis
	belongs_to :users
end