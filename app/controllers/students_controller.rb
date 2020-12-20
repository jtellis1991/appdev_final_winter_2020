class StudentsController < ApplicationController

  def show
    @student = Student.find(params[:id])
  end
  
  # def create
  #   @student = Student.new(params[:student])
  #   if @student.save
  #     #Handle a successful save
  #   else
  #     render 'new'
  #   end 
  # end
  
end
