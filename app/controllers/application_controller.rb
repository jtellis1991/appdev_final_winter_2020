class ApplicationController < ActionController::Base
  
    def after_sign_in_path_for(student)
        dashboard_path
    end
  
end
