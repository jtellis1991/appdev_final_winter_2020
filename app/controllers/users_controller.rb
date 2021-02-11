class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @test_attempts = @user.test_attempts
  end
  
  def edit
    @user = current_user
  end
  
  
end
