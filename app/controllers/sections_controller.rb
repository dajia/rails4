class SectionsController < ApplicationController

  #layout false
    layout "admin" #-> this tells to rails to use the admin.html.erb layout template 
  
  before_action :confirm_logged_in

  def index
    @sections = Section.sorted #we display list of subject using the scope of sorted
    @sections = Section.all#we display list of all subject 
  end

  def show
    @section = Section.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]

  end

  def new
    @section = Section.new(:name => "Default value")
    @pages = Page.order('posistion ASC')
    @section_count = Section.count + 1
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
    @section = Section.new(section_params)     
    #save the object
    if @section.save
    #if save succeds, redirect to somewhere, usually to index action
    flash[:notice] = "This section saved succesfully!"
    redirect_to(:action => "index")
    else
    #if save fails (according to data validation), redisplay the form so user can fix the problems and resubmit
    #we want the form to redisplay and have all the inputs user put in fields
    @pages = Page.order('posistion ASC')
    @section_count = Section.count + 1
    render("new")
    end
  end

  def edit
    @section = Section.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]
    @pages = Page.order('posistion ASC')
    @section_count = Section.count 
  end

  def update

    #find an existing object using form parameters
    @section = Section.find(params[:id])
    #update the attributes and the object
    if @section.update_attributes(section_params)     
    
    #if update succeds, redirect to somewhere, usually to show action
    flash[:notice] = "This section updated succesfully!"
    redirect_to(:action => "show", :id => @section.id)
    else
    #if update fails (according to data validation), redisplay the form so user can fix the problems and resubmit
    #we want the form to redisplay and have all the inputs user put in fields
    @pages = Page.order('posistion ASC')
    @section_count = Section.count    
    render("edit")
    end
  end

  def delete
    @section = Section.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]

  end

  def destroy
    #because destroy action will not display a template
    #we can use a local/simple variable (subject), not an instance vavriable (@subject) 
    #find the existing object
    #subject = Subject.find(params[:id]) # we find each subject by id, we retrieve the id from url using params[:id]
    #destroy the object
    #subject.destroy
    #we can find and destroy the object all in once
    section = Section.find(params[:id]).destroy
    #redirect to index
    flash[:notice] = "The section '#{section.name}' destroyed succesfully!"
    redirect_to(:action => "index")
  end


  private
#we make private the subject_params method, so it can not be called as an action
#only the subject controller can use it as parameter
    def section_params
#it is same as using "params[:subject]" except that it:
#-- raise an error if :subject is not present
#-- allows listed attributes to be mass-assigned
      params.require(:section).permit(:name, :posistion, :visible)
    end
end
