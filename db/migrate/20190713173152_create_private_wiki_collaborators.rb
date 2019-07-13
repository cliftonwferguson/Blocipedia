class CreatePrivateWikiCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :private_wiki_collaborators, id: false do |t|
    	t.references :users
    	t.references :wikis
    end
  end
end
