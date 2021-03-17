class QuestionsController < ApplicationController
  # layout 'app'
  
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
    @test = Test.find(params[:test_id])
    @questions = @test.questions
    @user = current_user
    @test_attempt = TestAttempt.where(:test_id => @test.id).where(:user_id => @user.id).last
    if @test_attempt.responses.empty?
      @num_responses = 0
    else
      @num_responses = @test_attempt.responses.count
    end
    
    @responses = @test_attempt.responses
    unanswered = Array.new
    @questions.each do |question|
      if @test_attempt.responses.where(:question_id => question.id).first.nil?
        unanswered.push(question.id)
      end 
    end 
    
    if unanswered.at(0).nil?
      @test.questions.each_with_index do |question, index|
        response = @responses.where(:question_id => question.id).first
        if response.choices.first.nil? && response.first.nil? && response.second.nil? && response.third.nil? && response.fourth.nil?
          unanswered.push(question.id)
        end 
      end 
    end
    
    @next_question = unanswered.at(0)
    
    render( { :template =>  "questions/index.html.erb" })
  end

  def show
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
    @letters = ('A'..'Z').to_a
    @user = current_user
    @strategies = @user.strategies
    @test_attempt = TestAttempt.where(:test_id => @test.id).where(:user_id => @user.id).last
    @response = @test_attempt.responses.where(:question_id => @question.id).last
    if !@response.nil? 
      @minutes = @response.milliseconds_elapsed / 60000
      @seconds = @response.milliseconds_elapsed % 60000 / 1000
      
      if @seconds < 10 
        @secs = "0" + @seconds.to_s
      else
        @secs = @seconds.to_s
      end 
      if @minutes < 10 
        @mins = "0" + @minutes.to_s
      else
        @mins = @minutes.to_s
      end 
      @clock = @mins + ":" + @secs
    else
      @clock = "00:00"
      @seconds = 0;
      @minutes = 0;
      @secs = 0;
      @mins = 0;
    end
    
    if @response.nil?
    @response = Response.new
    end
    @responses = @test_attempt.responses
    

      
    
    
    render( { :template =>  "questions/show.html.erb" })
  end
  
  def edit
    @question = Question.find(params[:id])
    @test = @question.test
    @options = @question.options
    @answers = @question.answers
    @phrases = @question.phrases
    
    @list_of_tests = Test.all
    @list_of_tests = @list_of_tests.map{ |test| [test.name, test.id]} 
    
    @list_of_categories = Category.all
    @list_of_categories = @list_of_categories.map{ |category| [category.name, category.id]} 
    
    @list_of_styles = Style.all
    @list_of_styles = @list_of_styles.map{ |style| [style.name, style.id]} 
    
    render( { :template => "questions/edit.html.erb"})
  
  end
  
  def update
    @question = Question.find(params[:id])
    @oldtest = @question.test
    @question.test = Test.find(params[:question][:test])
    @question.official_id = params[:question][:official_id]
    @question.category_id = params[:question][:category_id]
    @question.style_id = params[:question][:style_id]
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
