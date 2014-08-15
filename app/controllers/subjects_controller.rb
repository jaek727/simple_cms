class SubjectsController < ApplicationController

  # By default, rails will use the app/views/layouts/application.html.erb file.
  # If we want to override the default value, we use the layout command in next line.

  layout 'admin'   # this will now use app/views/layouts/admin.html.erb for layout.
 
  def index
    list
    render('list')
  end

  def list
    @subjects = Subject.order("subjects.position ASC")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    params.permit!
    @subject = Subject.new(params[:subject])
    if @subject.save
      flash[:notice] = "Subject created!"
      redirect_to(:action => 'list')
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # http://stackoverflow.com/questions/17335329/activemodelforbiddenattributeserror-when-creating-new-user
    params.permit!
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Subject updated!"
      #Either of the next two lines will work
      #First one goes back to list. Second one first shows 
      #redirect_to(:action => 'list')
      redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    #Method 1
    #@subject = Subject.find(params[:id])
    #@subject.destroy

    #Method 2 - don't need to use @ in front of subject since we're not going to display it.
    #subject = Subject.find(params[:id])
    #subject.destroy

    #Method 2 - don't need to use @ in front of subject since we're not going to display it.
    Subject.find(params[:id]).destroy
    flash[:notice] = "Subject deleted!"

    redirect_to(:action => 'list')
  end

  # http://stackoverflow.com/questions/17335329/activemodelforbiddenattributeserror-when-creating-new-user
  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
