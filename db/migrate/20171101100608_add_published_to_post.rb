class AddPublishedToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :published, :boolean, :null => false, :default => false
  end
end
