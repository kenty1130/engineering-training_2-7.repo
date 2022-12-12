class CreateFootsteps < ActiveRecord::Migration[7.0]
  def change
    create_table :footsteps do |t|
      t.integer :footstep, :null => false
      t.date :date , :null => false

      t.timestamps
    end
  end
end
