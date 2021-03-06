class ConfirmationsController < Devise::ConfirmationsController
  
    # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)
    yield resource if block_given?

    if successfully_sent?(resource)
      respond_with({}, location: after_resending_confirmation_instructions_path_for(resource_name))
    else
      # respond_with(resource)
      # This is Josh's contribution: hard to get both error and new render together
      flash[:alert] = resource.errors.full_messages.to_sentence
      redirect_to confirm_path
    end
  end
  
  protected
  
    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      # is_navigational_format? ? new_session_path(resource_name) : '/'
      confirm_path
    end
  
    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        # signed_in_root_path(resource)
        dashboard_path
      else
        # new_session_path(resource_name)
        login_path
      end
    end
  
end
