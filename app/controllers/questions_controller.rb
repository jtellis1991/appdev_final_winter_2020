class QuestionsController < ApplicationController
  
  
  def index
    questions = Question.all
    respond_to do |format|
      format.html { render :index, locals: { questions: questions } }
    end 
  end

  def show
    question = Question.find(params[:id])
    respond_to do |format|
      format.html { render :show, locals: { question: question } }
    end 
  end
  
end
