class ChangeEmail < ActiveRecord::Migration[5.0]
  def up
    change_column :maintainace_reports, :user_id, :string
  end

  def down
    change_column :maintainace_reports, :user_id, :integer
  end
end
