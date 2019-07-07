class AddPublishedToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :published, :boolean, default: true
  end
end
