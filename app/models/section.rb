class Section < ActiveRecord::Base
	has_many :section_edits
	has_many :editors, :through => :section_edits, :class_name => "AdminUser"
		
	CONTENT_TYPES = ['text', 'HTML']

	#simple validations

	#validates_presence_of :name
	#validates_length_of :name, :maximun => 255
	#validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"
	#validates_presence_of :content


	#sexy validations/ shortcut validations

	#sexy validations calling the exact same things as above behind 
	#the scenes, we just write less code and it is easiest to read


	validates :name, :presence => true
					 :length => {:maximum => 255}
	validates :content_type, :inclusion => CONTENT_TYPES	
	validates :content, :presence => true			 



	scope :visible, lambda { where(:visible => true) }
	scope :invisible, lambda { where(:visible => false) }
	scope :sorted, lambda { order("sections.posistion ASC") }
	scope :newest_first, lambda { order("sections.created_at DESC") }

end
