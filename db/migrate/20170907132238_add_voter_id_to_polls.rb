class AddVoterIdToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :voter_id, :integer
  end
end
