class Accessory < ActiveRecord::Base

	belongs_to :access_category

	has_attached_file :photo, 
						:styles => {:small => "150x150>", :medium => "300x300>"},
						:url => "/assets/accessories/:id/:style/:basename.:extension",
						:path => ":rails_root/public/assets/accessories/:id/:style/:basename.:extension"
	validates_attachment_presence :photo
	validates_attachment :photo, content_type: { content_type:  ["image/jpg", "image/jpeg", "image/png", "image/gif"] }


	validates_presence_of :name
	validates_length_of :name, :maximum => 50
	validates_presence_of :price
	validates_numericality_of :price, :message => "This is not a number"
	validates_presence_of :feature
	

end
