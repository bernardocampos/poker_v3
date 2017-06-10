class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.integer :user_id
      t.integer :table_id
      t.boolean :folded
      t.string :cards
      t.string :hand
      t.boolean :won
      t.boolean :lone_survivor

      t.timestamps
    end
  end
end
