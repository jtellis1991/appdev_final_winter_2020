class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to("/dashboard/")
    end
  end

  def support
  end
  
  def about
  end
  
  def blog
  end
end
