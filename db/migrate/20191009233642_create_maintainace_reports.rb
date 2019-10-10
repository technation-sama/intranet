class CreateMaintainaceReports < ActiveRecord::Migration[5.0]
  def change
    create_table :maintainace_reports do |t|
      t.integer :user_id
      t.string :location
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
