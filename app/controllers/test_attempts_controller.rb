class TestAttemptsController < ApplicationController
  

  def create
  @test_attempt = TestAttempt.new
  @user = User.find(params[:user][:id])
  @test = Test.find(params[:test][:id])
  @questions = @test.questions
  if !@user.nil?
  @test_attempt.test = @test
  @test_attempt.user = @user
  @test_attempt.save!
  redirect_to(test_question_path(@test.id, @questions.first.id))
  else
  end
    
  end
  
  def update
    raise
  @user = current_user
  @test = Test.find(params[:test][:id])
  @test_attempt = TestAttempt.where(:user_id => @user.id).first.where(:test_id => @test.id).first
  @questions = @test.questions
  @responses = @test_attempt.responses

  
  @test_attempt.save!
  redirect_to("/dashboard")
  end
  
  
end
