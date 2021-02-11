class ResponsesController < ApplicationController
  
  def create
  @response = Response.new
  @test_attempt = TestAttempt.find(params[:test_attempt][:id])
  @user = User.find(params[:user][:id])
  @question = Question.find(params[:question][:id])
  @test = @question.test
  @options = @question.options.where(:value => params[:option])
  
  @options.each do |option|
    if option.correct == false
      @response.correct = false
    end 
  end 
  if @response.correct.nil?
    @response.correct = true
  end
  @response.milliseconds_elapsed = params[:milliseconds]
  @response.question = @question
  @response.test_attempt = @test_attempt
  @response.user = @user
  @response.options = @options
  
  @response.save!
  
  @num_responses = @test_attempt.responses.count
  @next_question = @test.questions[@num_responses]
  
  redirect_to(test_question_path(@test.id, @next_question.id))
  end
  
end
