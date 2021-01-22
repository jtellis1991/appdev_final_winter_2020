class PasswordsController < Devise::PasswordsController
  # skip_before_action :verify_authenticity_token
  
    # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      # respond_with(resource)
      flash[:alert] = resource.errors.full_messages.to_sentence
      redirect_to reset_path
    end
  end
  
  
  protected
  
      # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      # new_session_path(resource_name) if is_navigational_format?
      reset_path
    end
  
end
