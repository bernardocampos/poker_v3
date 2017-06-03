class AddCardToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :c1, :string
    add_column :users, :c2, :string
  end
end
