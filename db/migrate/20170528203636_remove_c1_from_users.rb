class RemoveC1FromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :c1, :string
    remove_column :users, :c2, :string
  end
end
