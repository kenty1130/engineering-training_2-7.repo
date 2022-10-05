class CreateFootsteps < ActiveRecord::Migration[7.0]
  def change
    create_table :footsteps do |t|
      t.integer :footstep
      t.date :date
      t.integer :favo

      t.timestamps
    end
  end
end
