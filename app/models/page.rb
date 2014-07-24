class Page < ActiveRecord::Base

	belongs_to :subject

	#has_and_belongs_to_many :admin_users

	#simple validations

	#validates_presence_of :name
	#validates_length_of :name, :maximun => 255
	#validates_presence_of :permalink
	#validates_length_of :permalink, :within => 3..255
	#use presence_of with length_of to disallow spaces
	#validates_uniqueness_of :permalink
	#for unique values by subject use ":scope => subject_id"


	#sexy validations/ shortcut validations

	#sexy validations calling the exact same things as above behind
	#the scenes, we just write less code and it is easiest to read


	 validates :name, :presence => true,
	 				  :length => {:maximum => 255}

	 validates :permalink, :presence => true,
	 				  	   :length => {:within => 3..255},
	 				       :uniqueness => true

	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("pages.posistion ASC") }
	scope :newest_first, lambda { order("pages.created_at DESC") }
	#because a pages by convention has editors to edit it, we don't use
	#the :admin_users. Instead we use the role, :editors, and we set :editors
	#to inherit from class AdminUsers. So when we talk about editors, we talk about
	#admin users, because the editors class (model) does not (pre-)exist
	has_and_belongs_to_many :editors, :class_name => "AdminUser"
	#we must specify a foreign key for this relationship.
	#luckily we have define it in the subject_id table, in the create page migration
end
