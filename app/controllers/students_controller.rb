class StudentsController < ApplicationController
  # before_action 

  def show
    @student = current_student
  end
  
  def edit
    @student = current_student
  end
  
end
