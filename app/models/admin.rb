class Admin < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates_presence_of :f_name
	validates_length_of :f_name, :maximum => 25
	validates_presence_of :l_name
	validates_length_of :l_name, :maximum => 50
	validates_presence_of :username
	validates_length_of :username, :within => 8..25
	validates_uniqueness_of :username, :message => "Please try another username"
	validates_presence_of :email
	validates_length_of :email, :maximum => 100
	validates_format_of :email, :with => EMAIL_REGEX
	validates_confirmation_of :email
end
