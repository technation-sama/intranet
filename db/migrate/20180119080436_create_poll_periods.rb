class CreatePollPeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_periods do |t|
      t.string :period
      t.boolean :active

      t.timestamps
    end
  end
end
