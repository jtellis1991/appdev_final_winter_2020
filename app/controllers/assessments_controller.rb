class AssessmentsController < ApplicationController
  
  def show
    @question = Question.find(params[:id])
    @response = Response.new
    respond_to do |format|
      format.html { render :show, locals: { question: @question } }
    end 
  end
  
  
  
  # private 
  
  #   def written
  #     @questions = Question.all
  #     @empty_responses = []
      
  #     Question.all.each do
  #       @empty_responses << Response.new
  #     end
  #     render :layout => 'english'
  #   end
  
  
end
