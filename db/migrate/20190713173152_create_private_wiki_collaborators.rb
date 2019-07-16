class CreatePrivateWikiCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators, id: false do |t|
    	t.references :user
    	t.references :wiki
    end
  end
end
