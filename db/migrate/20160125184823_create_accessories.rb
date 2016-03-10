class CreateAccessories < ActiveRecord::Migration
  def up
    create_table :accessories do |t|
      t.integer "access_category_id"
      t.text :feature
      t.integer :price
      t.boolean :available
      t.text :other_info
      t.string :name

      t.timestamps null: false
    end
    add_index("accessories", "access_category_id")
  end

  def down
    drop_table :accessories
  end
end
