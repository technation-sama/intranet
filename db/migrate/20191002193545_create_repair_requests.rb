class CreateRepairRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :repair_requests do |t|
      t.string :area
      t.string :category
      t.text :description

      t.timestamps
    end
  end
end
