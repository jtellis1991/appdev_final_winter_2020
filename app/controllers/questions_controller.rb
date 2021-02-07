class QuestionsController < ApplicationController
  layout 'app'
  
  def create
    @question = Question.new
    @test = Test.find(params[:test][:id])
    @question.test = @test
    @question.official_id = params[:official_id]
    @question.category_id = params[:category_id]
    @question.body = params[:body]
    @question.prompt = params[:prompt]
    @question.difficulty = params[:difficulty]
    @question.image = params[:image]
    if !@question.nil?
      @question.save
    end
    redirect_to(edit_test_path(@test))
  end
  
  
  
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
    
    @list_of_tests = Test.all
    @list_of_tests = @list_of_tests.map{ |test| [test.name, test.id]} 
    
    @list_of_categories = Category.all
    @list_of_categories = @list_of_categories.map{ |category| [category.name, category.id]} 
    
    render( { :template => "questions/edit.html.erb"})
  
  end
  
  def update
    @question = Question.find(params[:id])
    @oldtest = @question.test
    @question.test = Test.find(params[:question][:test])
    @question.official_id = params[:question][:official_id]
    @question.category_id = params[:question][:category_id]
    @question.body = params[:question][:body]
    @question.prompt = params[:question][:prompt]
    @question.difficulty = params[:question][:difficulty]
    @question.image = params[:question][:image]
    @question.save!

    if @oldtest != @question.test
    redirect_to(edit_test_path(@oldtest))
    else
    redirect_to(edit_question_path(@question))
    end
  end
  
  def destroy
    @question = Question.find(params[:id])
    @test = @question.test
    @question.destroy
    
    redirect_to(edit_test_path(@test))
  end
  
end
