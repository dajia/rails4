class AccessController < ApplicationController

layout "admin"

#before_action :name of the before action, :except => [:name of the actions at down that we dont want to get that before action]

before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

def index
  	#display text & links
  end

  def login
  	#login form
  end
  
  def attempt_login
 	if params[:username].present? && params[:password].present?
 		found_user = AdminUser.where(:username => params[:username]).first
 		if found_user
 			authorized_user = found_user.authenticate(params[:password])
  		end
  	end

  	if authorized_user
	# mark user as logged in
	sessions[:user_id] = authorized_user.id
	sessions[:username] = authorized_user.username
	flash[:notice] = "You are now logged in!"
	redirect_to(:action => "index")
	else
	flash[:notice] = "Invalid username/password combination. Sorry! :-("
	redirect_to(:action => "login")
  	end
end


  def logout
  	# mark user as logged in
  	sessions[:user_id] = nil
	sessions[:username] = nil
	flash[:notice] = "Logged out!"
	redirect_to(:action => "login")
 
  end



end
