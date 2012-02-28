class ChangeEncryptedToDigest < ActiveRecord::Migration
  def up
    rename_column :users, :encrypted_password, :password_digest
  end

  def down
    rename_column :users, :password_digest, :encrypted_password
  end
end
