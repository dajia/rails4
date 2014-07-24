class SubjectsController < ApplicationController

  #layout false
  layout "admin" #-> this tells to rails to use the admin.html.erb layout template 
  
  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted #we display list of subject using the scope of sorted
    @subjects = Subject.all#we display list of all subject 
  end

  def show
    @subject = Subject.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]
    
  end

  def new
    @subject = Subject.new(:name => "Default value")
    @subject_count = Subject.count + 1
  end

  def create
   #Main steps for creating/processing the form

    #instantiate a new object using form parameters
    #@subject = Subject.new(params[:subject])
    #we have to specify which parameters can be mass assigned as attributes
    #@subject = Subject.new(params.require(:subject).permit(:name, :posistion, :visible))
    #best practice is to put the above strong parameters in the buttom of the controller
    # and assign ti to a local/private def variable. Then they  use the 
    #private variable as a parameter
    @subject = Subject.new(subject_params)     
    #save the object
    if @subject.save
    #if save succeds, redirect to somewhere, usually to index action
    flash[:notice] = "This subject saved succesfully!"
    redirect_to(:action => "index")
    else
    #if save fails (according to data validation), redisplay the form so user can fix the problems and resubmit
    #we want the form to redisplay and have all the inputs user put in fields
    @subject_count = Subject.count + 1
    render("new")
    end
  end

  def edit
    @subject = Subject.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]
    @subject_count = Subject.count
  end

  def update

    #find an existing object using form parameters
    @subject = Subject.find(params[:id])
    #update the attributes and the object
    if @subject.update_attributes(subject_params)     
    
    #if update succeds, redirect to somewhere, usually to show action
    flash[:notice] = "This subject updated succesfully!"
    redirect_to(:action => "show", :id => @subject.id)
    else
    #if update fails (according to data validation), redisplay the form so user can fix the problems and resubmit
    #we want the form to redisplay and have all the inputs user put in fields
    @subject_count = Subject.count
    render("edit")
    end
  end

  def delete
    @subject = Subject.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]

  end

  def destroy
    #because destroy action will not display a template
    #we can use a local/simple variable (subject), not an instance vavriable (@subject) 
    #find the existing object
    #subject = Subject.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]
    #destroy the object
    #subject.destroy
    #we can find and destroy the object all in once
    subject = Subject.find(params[:id]).destroy
    #redirect to index
    flash[:notice] = "The subject '#{subject.name}' destroyed succesfully!"
    redirect_to(:action => "index")
  end


  private
#we make private the subject_params method, so it can not be called as an action
#only the subject controller can use it as parameter
    def subject_params
#it is same as using "params[:subject]" except that it:
#-- raise an error if :subject is not present
#-- allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :posistion, :visible, :created_at)
    end
end
