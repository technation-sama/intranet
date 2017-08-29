class AddProjectNameToPolls < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :project_name, :string
  end
end
