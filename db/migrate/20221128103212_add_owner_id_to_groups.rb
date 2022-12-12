class AddOwnerIdToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :owner_id, :integer
  end
end
