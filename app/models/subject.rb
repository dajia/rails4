class Subject < ActiveRecord::Base

has_many :pages

#Don't need to validate (in mot cases):
#ids, foreign keys, timestamps, booleans, counters

	#simple validations


#validates_presence_of :name
#validates_length_of :name, :maximum => 255
#validates_presence_of vs validates_length of : minimun => 1
#different error messages: "can;t be blank" or "is too short"
#validates_length_of allows strings with only spaces!


#sexy validations/ shortcut validations

#sexy validations calling the exact same things as above behind 
#the scenes, we just write less code and it is easiest to read


validates :name, :presence => true
				 :length => {:maximum => 255}


scope :visible, lambda { where(:visible => true) }
#subject.visible
scope :invisible, lambda { where(:visible => false) }
#subject.invisible
scope :newewst_first, lambda { order( "subjects.created_at DESC") }
#subject.newewst_first
scope :sorted, lambda { order("subjects.posistion ASC") }
#subject.sorted
scope :search, lambda {|query|
	where (["name LIKE ?", "%#{query}%"])
}
#subject.search("Initial") 
#"%#{query}%" -> δεν θα ψαχνει να βρει exact match, αλλα θα εμφανισει όπου περιεχεταο το Initial


#Subject.search("vise")
 # Subject Load (4.2ms)  SELECT `subjects`.* FROM `subjects`  WHERE (name LIKE '%vise%')
#=> #<ActiveRecord::Relation [#<Subject id: 2, name: "Revised Subject", posistion: 2, visible: true, created_at: "2014-07-10 13:00:34", updated_at: "2014-07-10 13:37:19">]>

end
