class AddUsernameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique: true, null: false, default: -> { "MD5((random())::text)" }

    add_index :users, :username
  end
end
