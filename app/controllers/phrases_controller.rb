class PhrasesController < ApplicationController
  
  def create
    @question = Question.find(params[:question][:id])
    @phrase = Phrase.new
    @test = @question.test
    @phrase.text_to_translate = params[:text_to_translate]
    @phrase.translated_text = params[:translated_text]
    @phrase.question = @question
    
    if !@phrase.nil?
      @phrase.save
    end
    
    redirect_to(edit_question_path(@question))
  end
  

  
  def update
    @question = Question.find(params[:question][:id])
    @phrase = Phrase.find(params[:id])
    @phrase.text_to_translate = params[:phrase][:text_to_translate]
    @phrase.translated_text = params[:phrase][:translated_text]
    
    if !@phrase.nil?
      @phrase.save
    end
    
    redirect_to(edit_question_path(@question))
  end
  
  def destroy
    @phrase = Phrase.find(params[:id])
    @question = @phrase.question
    @phrase.destroy
    
    redirect_to(edit_question_path(@question))
  end
  
  
end
