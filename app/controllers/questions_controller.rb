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
  
  def update
    @question = Question.find(params[:id])
    @question.official_id = params[:question][:official_id]
    @question.category_id = params[:question][:category_id]
    @question.body = params[:question][:body]
    @question.prompt = params[:question][:prompt]
    @question.difficulty = params[:question][:difficulty]
    @question.image = params[:question][:image]
    
    @question.save
    
    redirect_to(edit_question_path(@question))
  end
  
end
