class AddOmniauthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_refresh_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :profile, :string
    add_column :users, :hd, :string
    add_column :users, :gender, :string
  end
end
