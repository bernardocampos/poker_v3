class RenameSecretIdToEmail < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :secret_id, :email
  end
end
