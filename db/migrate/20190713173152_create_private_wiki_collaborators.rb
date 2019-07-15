class CreatePrivateWikiCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :private_wiki_collaborators, id: false do |t|
    	t.references :user
    	t.references :wiki
    end
  end
end
