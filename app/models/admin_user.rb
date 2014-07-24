class AdminUser < ActiveRecord::Base
	#we do this when we want to configure different table name
	#self.table_name = "admin_users"

	# or we rename model's file name and of course model's class
	#like we did here we renamed the file name from "user" to "admin_users" and the model's class name fron "User" to "AdminUser" 

	has_secure_password

	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits


	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9._]+\.[a-z]{2,4}\Z/i

	#simple validations

	#validates_presence_of :first_name
	#validates_length_of :first_name, :maximum => 25
	#validates_presence_of :last_name
	#validates_length_of :last_name, :maximum => 50
	#validates_presence_of :username
	#validates_length_of :username, :within => 8..25
	#validates_uniqueness_of :username
	#validates_presence_of :email
	#validates_length_of :email, :maximum => 100
	#validates_format_of :email, :with => EMAIL_REGEX
	#validates_confirmation_of :email

	#sexy validations/ shortcut validations

	#sexy validations calling the exact same things as above behind 
	#the scenes, we just write less code and it is easiest to read

	validates :first_name, :presence => true,
							:length => {:maximum => 25}
	

	validates :last_name, :presence => true,
							:length => {:maximum => 50}

	validates :username, :presence => true,
						  :length => {:within => 8..25},
						  :uniqueness => true

	validates :email, :presence => true,
					   :length => {:maximum => 100},
   					   :format => EMAIL_REGEX,
   					   :confirmation => true



   
   #CUSTOM VALIDATIONS

   FORBIDDEN_USERNAMES = ["littlebopeep", "humptydympty", "marymary"]					   


   #validate :the_name_of_the_custom_validation_method

   #def the_name_of_the_custom_validation_method
   	#ruby code goes here!

	   	#if ...............
	   		#we add ana error
	   		#errors.add(:username, "message of that error")
	   	#end
   #end 
	
	validate :username_is_allowed						  

	def username_is_allowed
	   	if FORBIDDEN_USERNAMES.include?(username)
	   		errors.add(:username, "This username is not allowed!Sorry!")
	   	end
	end


	
end
