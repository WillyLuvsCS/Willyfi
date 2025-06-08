class RenamePasswordHashToEncryptedPasswordInUsers < ActiveRecord::Migration[8.0]
  def change
    rename_column :users, :password_hash, :encrypted_password
  end
end
