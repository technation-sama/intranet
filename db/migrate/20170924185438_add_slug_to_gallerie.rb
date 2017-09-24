class AddSlugToGallerie < ActiveRecord::Migration[5.0]
  def change
    add_column :galleries, :slug, :string
    add_index :galleries, :slug, unique: true
  end
end
