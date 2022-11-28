class AddIndexGroupUsers < ActiveRecord::Migration[7.0]
  def up
    add_index :group_users, [:user_id, :group_id], unique: true
  end
end
