class DemoController < ApplicationController
  def index
    # All three lines below are the same
    #render(:action => 'hello')  # deprecated way of doing this
    #render(:template => 'demo/hello')
    #render('demo/hello')
    #render('hello') # this calls the hello template
    #redirect_to(:controller => 'demo', :action => 'other_hello')
    #redirect_to(:action => 'other_hello')

  end

  # this will render the hello template
  def hello 
    #redirect_to("http://www.sfgate.com")
    @array = [1,2,3,4,5]
    @id = params[:id]
    @page = params[:page]
  end

  def other_hello
    render(:text => 'Hello Everyone!')
  end

  def text_helpers
  end

end
