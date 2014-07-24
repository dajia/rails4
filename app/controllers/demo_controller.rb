class DemoController < ApplicationController
 
 layout 'application'

  def index
   	@id = params['id']
 	@page = params[:page]
  end

  def hello
 	#render('index')
 	@array = [1,2,3,4,5] #i create an instance variable
  end


  def other_hello
  	redirect_to(:controller =>'demo', :action => "index")
  end


  def polyptychon
  	redirect_to('http://www.polyptychon.gr')
  end

end
