class TestsController < ApplicationController
  
  def show
    render({:template => "/tests/show.html.erb"})
    
  end
  
  def index
    @tests = Test.all
    
    render({:template => "/tests/index.html.erb"})
  end
  
end
