class AddMinBetToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :min_bet, :integer
  end
end
