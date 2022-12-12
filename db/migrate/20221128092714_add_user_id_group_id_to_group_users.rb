class AddUserIdGroupIdToGroupUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :group_users, :user, foreign_key: true
    add_reference :group_users, :group, foreign_key: true
  end
end
