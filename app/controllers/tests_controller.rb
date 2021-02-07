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
    end

    @tests = Test.all
    render({:template => "/tests/index.html.erb"})
  end
 
 
  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
    
    
    render({:template => "/tests/show.html.erb"})
  end
  
  
  def edit
    @test = Test.find(params[:id])
    @questions = @test.questions
    
    
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
