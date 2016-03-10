class CreateDevices < ActiveRecord::Migration
  def up
    create_table :devices do |t|
      t.string :name
      t.string :model
      t.string :device_type
      t.text :description

      t.timestamps null: false
    end
  end

  def down
  	drop_table :devices
  end
end
