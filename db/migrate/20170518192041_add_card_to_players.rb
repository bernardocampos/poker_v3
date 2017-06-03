class AddCardToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :c1, :string
    add_column :players, :c2, :string
  end
end
