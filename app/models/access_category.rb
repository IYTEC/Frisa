class AccessCategory < ActiveRecord::Base
	has_many :accessories

	validates_presence_of :name
	validates_length_of :name, :maximum => 255
	validates_presence_of :description
end
