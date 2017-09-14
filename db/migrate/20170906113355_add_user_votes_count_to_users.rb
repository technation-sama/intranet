class AddUserVotesCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :polls_count, :integer
  end
end
