class AnswersController < ApplicationController
  
    def create
    @question = Question.find(params[:question][:id])
    @answer = Answer.new
    @answer.correct_answer = params[:correct_answer]
    @answer.question = @question
    
    if !@answer.nil?
      @answer.save
    end
    
    redirect_to(edit_question_path(@question))
  end
  
  def update
    @question = Question.find(params[:question][:id])
    @answer = Answer.find(params[:id])
    @answer.correct_answer = params[:answer][:correct_answer]
    
    if !@answer.nil?
      @answer.save
    end
    
    redirect_to(edit_question_path(@question))
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question
    @answer.destroy
    
    redirect_to(edit_question_path(@question))
  end
  
end
