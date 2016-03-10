class AddPasswordDigestToAdminUsers < ActiveRecord::Migration
  def up
  	remove_column "admins", "hashed_password"
  	add_column "admins", "username", :string
  	add_column "admins", "password_digest", :string
  end

  def down
  	add_column "admins", "hashed_password"
  	remove_column "admins", "username"
  	remove_column "admins", "password_digest"
  end
end
