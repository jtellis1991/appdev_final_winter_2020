class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_student
  end
  
  def edit
    @user = current_student
  end
  
end
