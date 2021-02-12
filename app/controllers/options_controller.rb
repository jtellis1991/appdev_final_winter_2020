class OptionsController < ApplicationController
  
  def create
    @question = Question.find(params[:question][:id])
    @option = Option.new
    @option.value = params[:value]
    @option.question = @question
    @option.correct = params[:correct]
    
    if !@option.nil?
      @option.save
    end
    
    redirect_to(edit_question_path(@question))
  end
  
  def update
    @question = Question.find(params[:question][:id])
    @option = Option.find(params[:id])
    @option.value = params[:option][:value]
    @option.correct = params[:option][:correct]
    
    if !@option.nil?
      @option.save!
    end
    
    redirect_to(edit_question_path(@question))
  end
  
  def destroy
    @option = Option.find(params[:id])
    @question = @option.question
    @option.destroy
    
    redirect_to(edit_question_path(@question))
  end
  
  
  
end
