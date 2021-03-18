class ResponsesController < ApplicationController
  
  def create
  @response = Response.new
  @test_attempt = TestAttempt.find(params[:test_attempt][:id])
  @user = User.find(params[:user][:id])
  @question = Question.find(params[:question][:id])
  @test = @question.test
  @style = @question.style
  
  if @style.name == "math select one"
  
    @options = @question.options.where(:value => params[:option])
    @response.options = @options
    if @response.choices.first.nil?
      @response.correct = false
    else
      @response.correct = @response.choices.first.option.correct
    end
      
  else
    @answers = @question.answers
    @response.first = params["first col"]
    @response.second = params["second col"]
    @response.third = params["third col"]
    @response.fourth = params["fourth col"]
    if params["first col"].nil? && params["third col"].nil? && !params["second col"].nil? && !params["fourth col"].nil?
      @response.correct = false
    elsif !params["first col"].nil? && !params["third col"].nil? && params["second col"].nil? && params["fourth col"].nil?
      @response.correct = false
    elsif !params["first col"].nil? && params["third col"].nil? && params["second col"].nil? && !params["fourth col"].nil?
      @response.correct = false
    elsif
    text = @response.first.to_s + @response.second.to_s + @response.third.to_s + @response.fourth.to_s
      @answers.each do |answer|
        if answer.correct_answer.gsub(/[^a-z0-9$.\/]/, "") == text.gsub(/[^a-z0-9$.\/]/, "") 
          @response.correct = true
        end
      end
    end
    if @response.correct.nil?
      @response.correct = false
    end
  end
  
  @response.milliseconds_elapsed = params[:milliseconds]
  @response.question = @question
  @response.test_attempt = @test_attempt
  @response.user = @user

  @response.save!
    
  if params[:direction].nil?
    @test.questions.each_with_index do |question, index|
      if question.id == @question.id && @question.id != @test.questions.last.id
        @next_question = @test.questions[index + 1]
      end 
      if @next_question.nil?
        @next_question = @test.questions.first
      end
    end
    redirect_to(test_question_path(@test.id, @next_question.id))
  elsif params[:direction] == "score"
    i = 0
    @test_attempt.responses.each do |response|
      if response.correct
        i = i+1
      end 
    end
    @test_attempt.update_attribute(:score, i)
    redirect_to(test_responses_path(@test.id))
  else
    @next_question = Question.find(params[:direction])
    redirect_to(test_question_path(@test.id, @next_question.id))
  end
  
  end
  
  def update
  @response = Response.find(params[:id])
  @test_attempt = TestAttempt.find(params[:test_attempt][:id])
  @question = Question.find(params[:question][:id])
  @test = @question.test
  @style = @question.style
  
  if @style.name == "math select one"
    @options = @question.options.where(:value => params[:option])
    @response.options = @options
    if @response.choices.first.nil?
      @response.correct = false
    else
      @response.correct = @response.choices.first.option.correct
    end
    
    
    
  else
    @answers = @question.answers
    @response.first = params["first col"]
    @response.second = params["second col"]
    @response.third = params["third col"]
    @response.fourth = params["fourth col"]
    if params["first col"].nil? && params["third col"].nil? && !params["second col"].nil? && !params["fourth col"].nil?
      @response.correct = false
    elsif !params["first col"].nil? && !params["third col"].nil? && params["second col"].nil? && params["fourth col"].nil?
      @response.correct = false
    elsif !params["first col"].nil? && params["third col"].nil? && params["second col"].nil? && !params["fourth col"].nil?
      @response.correct = false
    elsif
    text = @response.first.to_s + @response.second.to_s + @response.third.to_s + @response.fourth.to_s
      @answers.each do |answer|
        if answer.correct_answer.gsub(/[^a-z0-9$.\/]/, "") == text.gsub(/[^a-z0-9$.\/]/, "") 
          @response.correct = true
        end
      end
    end
    if @response.correct.nil?
      @response.correct = false
    end
  end
  
  @response.milliseconds_elapsed = params[:milliseconds]
  @response.save!
  
  if params[:direction].nil?
    @test.questions.each_with_index do |question, index|
      if question.id == @question.id && @question.id != @test.questions.last.id
        @next_question = @test.questions[index + 1]
      end 
      if @next_question.nil?
        @next_question = @test.questions.first
      end
    end
    redirect_to(test_question_path(@test.id, @next_question.id))
  elsif params[:direction] == "score"
    i = 0
    @test_attempt.responses.each do |response|
      if response.correct
        i = i+1
      end 
    end
    @test_attempt.update_attribute(:score, i)
    redirect_to(test_responses_path(@test.id))
  else
    @next_question = Question.find(params[:direction])
    redirect_to(test_question_path(@test.id, @next_question.id))
  end
  
  end
  
  
  def index
  @user = current_user
  @test = Test.find(params[:test_id])
  @questions = @test.questions
  @test_attempt = TestAttempt.where(:user_id => @user.id ).where(:test_id => @test.id).first
  @responses = @test_attempt.responses
  
  render({:template => "/responses/index.html.erb"})
  end
  
  def show
  # raise
  @user = current_user
  @test = Test.find(params[:test_id])
  @questions = @test.questions
  @letters = ('A'..'Z').to_a
  @test_attempt = TestAttempt.where(:user_id => @user.id ).where(:test_id => @test.id).first
  @responses = @test_attempt.responses
  @response = Response.find(params[:id])
  @question = @response.question
  @minutes = @response.milliseconds_elapsed / 60000
  @seconds = @response.milliseconds_elapsed % 60000 / 1000
  
  if @seconds < 10 && @minutes < 10
    @clock = "0" + @minutes.to_s + ":0" + @seconds.to_s
  elsif @minutes < 10
    @clock = "0" + @minutes.to_s + ":" + @seconds.to_s
  elsif @seconds < 10
    @clock = @minutes.to_s + ":0" + @seconds.to_s
  else
    @clock = @minutes.to_s + ":" + @seconds.to_s
  end
  
  render({:template => "/responses/show.html.erb"})
  end
  
  
end
