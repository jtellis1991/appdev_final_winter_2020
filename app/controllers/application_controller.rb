class ApplicationController < ActionController::Base
  
    def after_sign_in_path_for(user)
        dashboard_path
    end
    
      protected
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to login_path, :alert => 'You must sign in before accessing ' + request.path
      ## if you want render 404 page
      ## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    end
  end
  
end
