class TestsController < ApplicationController
  
  def create
    @test = Test.new
    @test.name = params[:name]
    
    if !@test.nil?
      @test.save
    end
    @tests = Test.all
    
    render({:template => "/tests/index.html.erb"})
  end
  
  def destroy
    @test = Test.find(params[:id])
    
    if @test.questions.empty?
      @test.destroy
      @tests = Test.all
      render({:template => "/tests/index.html.erb"})
    else
    flash[:alert] = "Cannot delete test containing questions, move questions to other tests before deleting"
    redirect_to(edit_test_path(@test))
    end
  end
 
 
  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
    
    
    render({:template => "/tests/show.html.erb"})
  end
  
  
  def edit
    @test = Test.find(params[:id])
    @questions = @test.questions
    
    @list_of_tests = Test.all
    @list_of_tests = @list_of_tests.map{ |test| [test.name, test.id]} 
    
    @list_of_categories = Category.all
    @list_of_categories = @list_of_categories.map{ |category| [category.name, category.id]} 
    
    
    render({:template => "/tests/edit.html.erb"})
  end
  
  def index
    @tests = Test.all
    
    render({:template => "/tests/index.html.erb"})
  end
  
  def update
    @test = Test.find(params[:id])
    @questions = @test.questions
    @newname = params[:test][:name]
    
    if !@newname.nil?
      @test.name = @newname
      @test.save
    end
    
    render({:template => "/tests/edit.html.erb"})
  end
end
