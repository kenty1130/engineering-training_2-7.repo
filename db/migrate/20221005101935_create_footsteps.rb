class CreateFootsteps < ActiveRecord::Migration[7.0]
  def change
    create_table :footsteps do |t|
      t.integer :footstep, :null => false
      t.date :date , :null => false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :footsteps, [:date, :user_id], unique: true
  end
end
