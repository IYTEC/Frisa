class CreateAccessCategories < ActiveRecord::Migration
  def up
    create_table :access_categories do |t|
      #t.integer "accessory_id"
      t.string :name
      t.text :description

      t.timestamps null: false
    end
    #add_index("access_categories", "accessory_id")
  end


	def down
		drop_table :access_categories
	end
end