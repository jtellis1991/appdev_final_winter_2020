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
  
end
