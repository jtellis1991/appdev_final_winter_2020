class QuestionsController < ApplicationController
  layout 'app'
  
  def index
    @questions = Question.all
    render( { :template =>  "questions/index.html.erb" })
    
  end

  def show
    @question = Question.find(params[:id])
    
    render( { :template =>  "questions/show.html.erb" })
  end
  
  def edit
    @question = Question.find(params[:id])
    @test = @question.test
    @options = @question.options
    @answer = @question.answer
    @phrases = @question.phrases
    
    render( { :template => "questions/edit.html.erb"})
  
  end
  
end
