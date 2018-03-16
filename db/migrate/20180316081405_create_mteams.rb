class CreateMteams < ActiveRecord::Migration[5.0]
  def change
    create_table :mteams do |t|
      t.string :title
      t.text :question

      t.timestamps
    end
  end
end
