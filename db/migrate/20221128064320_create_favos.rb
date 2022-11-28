class CreateFavos < ActiveRecord::Migration[7.0]
  def change
    create_table :favos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :footstep, null: false, foreign_key: true
      t.timestamps
    end
  end
end
