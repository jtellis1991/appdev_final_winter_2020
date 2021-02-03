class TestsController < ApplicationController
  
  def show
    render({:template => "/test_templates/baseline.html.erb"})
    
  end
  
end
