class AddWinningHandsToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :winning_hands, :string
  end
end
