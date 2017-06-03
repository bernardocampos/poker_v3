class AddLatestWinnersToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :winners, :string
    add_column :tables, :winnings, :string
  end
end
