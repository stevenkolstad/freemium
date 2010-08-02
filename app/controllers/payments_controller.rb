class PaymentsController < ApplicationController
	include Devise::Controllers::InternalHelpers

  # GET /resource/invitation/new
  def new
    build_resource
    render_with_scope :new
  end
  
  # POST /resource/invitation
  def create
    self.resource = resource_class.send_invitation(params[resource_name])

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions
      redirect_to after_sign_in_path_for(resource_name)
    else
      render_with_scope :new
    end
  end  

end