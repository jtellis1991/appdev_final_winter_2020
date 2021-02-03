class QuestionsController < ApplicationController
  layout 'app'
  
  def index
    @questions = Question.all
    render( { :index =>  "questions/index.html.erb" })
    
  end

  def show
    question = Question.find(params[:id])
    respond_to do |format|
      format.html { render :show, locals: { question: question } }
    end 
  end
  
end
