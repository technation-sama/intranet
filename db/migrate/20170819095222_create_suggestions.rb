class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
