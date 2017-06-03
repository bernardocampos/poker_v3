class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.integer :pot
      t.string :stage
      t.integer :button_holder
      t.integer :active_player
      t.string :p1c1
      t.string :p1c2
      t.string :p2c1
      t.string :p2c2
      t.string :p3c1
      t.string :p3c2
      t.string :p4c1
      t.string :p4c2
      t.string :p5c1
      t.string :p5c2
      t.string :p6c1
      t.string :p6c2
      t.string :flop1
      t.string :flop2
      t.string :flop3
      t.string :river
      t.string :turn
      t.integer :small_blind
      t.integer :big_blind

      t.timestamps
    end
  end
end
