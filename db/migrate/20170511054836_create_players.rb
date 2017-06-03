class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.integer :table_id
      t.integer :user_id
      t.integer :player_number
      t.boolean :folded
      t.integer :buy_ins
      t.integer :purse
      t.integer :latest_bet_this_round

      t.timestamps
    end
  end
end
