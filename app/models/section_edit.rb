class SectionEdit < ActiveRecord::Base
	belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
	#because we don't have an editot id to use it as a foreign key, because editor model does
	#not exists, we must specify the foreign key, and this will be the foreign key
	#of the model that use the class we also specify for the psedo-model name :editors

	#belongs_to :admin_users

	#because a section by convention has editors to edit it, we don't use 
	#the :admin_users. Instead we use the role, :editors, and we set :editors 
	#to inherit from class AdminUsers. So when we talk about editors, we talk about 
	#admin users, because the editors class (model) does not (pre-)exist 

	belongs_to :sections

end
