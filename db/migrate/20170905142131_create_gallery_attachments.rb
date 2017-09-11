class CreateGalleryAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :gallery_attachments do |t|
      t.references :gallery, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
