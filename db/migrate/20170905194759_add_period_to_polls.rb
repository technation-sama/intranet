class AddPeriodToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :period, :string
  end
end
