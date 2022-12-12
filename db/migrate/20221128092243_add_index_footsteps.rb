class AddIndexFootsteps < ActiveRecord::Migration[7.0]
  def up
    add_index :footsteps, [:user_id, :date], unique: true
  end
end
