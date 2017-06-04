class AddPasswordToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :password, :string
  end
end
