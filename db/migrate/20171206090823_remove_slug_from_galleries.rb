class RemoveSlugFromGalleries < ActiveRecord::Migration[5.0]
  def change
    remove_column :galleries, :slug, :string
  end
end
