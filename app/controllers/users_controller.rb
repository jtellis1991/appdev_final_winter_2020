class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @test_attempts = @user.test_attempts
    @strategies = Strategy.all
    
    render({:template => "/users/show.html.erb"})
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @strategies = @user.strategies
    @activations = @user.activations
    
    @strategies.each do |strategy|
      activation = @activations.where(:strategy_id => strategy.id).last
      if params[strategy.name.gsub(" ", "_")] == "on"
        activation.update_attribute(:active, true)
      else
        activation.update_attribute(:active, false)
      end 
    redirect_back(fallback_location:"/dashboard")   
    end
    
  end
  
end
