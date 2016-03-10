class CreateAdmins < ActiveRecord::Migration
  def up
    create_table :admins do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :hashed_password
      t.string :admin_type

      t.timestamps null: false
    end
  end

  def down
    drop_table :admins
  end
end
