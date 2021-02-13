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
    @options.each do |option|
      if option.correct == false
        @response.correct = false
      end 
    end 
    if @response.correct.nil?
      @response.correct = true
    end
    @response.options = @options
      
  else
    @answers = @question.answers
    text = params["first col"] + params["second col"] + params["third col"] + params["fourth col"]
    @response.text_submitted = text
    @response.correct = nil
    @answers.each do |answer|
      if answer.correct_answer.gsub(/[^a-z0-9$.\/]/, "") == @response.text_submitted.gsub(/[^a-z0-9$.\/]/, "") 
        @response.correct = true
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
  
  @test.questions.each_with_index do |question, index|
    if question.id == @question.id
      @next_question = @test.questions[index + 1]
    end 
  end 
  
  redirect_to(test_question_path(@test.id, @next_question.id))
  end
  
  def update
  @response = Response.find(params[:id])
  @test_attempt = TestAttempt.find(params[:test_attempt][:id])
  @question = Question.find(params[:question][:id])
  @test = @question.test
  @style = @question.style
  
  if @style.name == "math select one"
    @options = @question.options.where(:value => params[:option])
    @response.correct = nil
    @options.each do |option|
      if option.correct == false
        @response.correct = false
      end 
    end 
    if @response.correct.nil?
      @response.correct = true
    end
    @response.options = @options
  else
    @answers = @question.answers
    if params["first col"].nil?
      first_col = ""
    else
      first_col = params["first col"]
    end 
    if params["second col"].nil?
      second_col = ""
    else
      second_col = params["second col"]
    end 
    if params["third col"].nil?
      third_col = ""
    else
      third_col = params["third col"]
    end 
    if params["fourth col"].nil?
      fourth_col = ""
    else
      fourth_col = params["fourth col"]
    end 
    text = first_col + second_col + third_col + fourth_col
    @response.text_submitted = text
    @response.correct = nil
    @answers.each do |answer|
      if answer.correct_answer.gsub(/[^a-z0-9$.\/]/, "") == @response.text_submitted.gsub(/[^a-z0-9$.\/]/, "") 
        @response.correct = true
      end
    end
    if @response.correct.nil?
      @response.correct = false
    elsif params["first col"].nil? && params["third col"].nil? && !params["second col"].nil? && !params["fourth col"].nil?
      @response.correct = false
    elsif !params["first col"].nil? && !params["third col"].nil? && params["second col"].nil? && params["fourth col"].nil?
      @response.correct = false
    elsif !params["first col"].nil? && params["third col"].nil? && params["second col"].nil? && !params["fourth col"].nil?
      @response.correct = false
    end
  end
  
  @response.milliseconds_elapsed = params[:milliseconds]
  @response.save!
  
  @test.questions.each_with_index do |question, index|
    if question.id == @question.id
      @next_question = @test.questions[index + 1]
    end 
  end 
    
  redirect_to(test_question_path(@test.id, @next_question.id))
  end
  
end
