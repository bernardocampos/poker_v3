class AddLatestMoveToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :latest_move, :string
  end
end
