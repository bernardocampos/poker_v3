class AddBuyInToTable < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :buy_in, :integer
  end
end
