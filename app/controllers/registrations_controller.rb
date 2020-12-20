class RegistrationsController < Devise::RegistrationsController
  
  def after_inactive_sign_up_path_for(resource)
    signup_path
  end
  
end
