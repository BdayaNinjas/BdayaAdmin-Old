class Members::InvitationsController < ApplicationController
   def edit
      #This may be required to override strong parameters
        if params[:invitation_token] && self.resource = resource_class.to_adapter.find_first( :invitation_token => allowed_params[:invitation_token] )
          render :edit
        else
          set_flash_message(:alert, :invitation_token_invalid)
          redirect_to after_sign_out_path_for(resource_name)
        end
    end

    def update
    self.resource = resource_class.accept_invitation!(allowed_params[:member])

    if resource.errors.empty?
      set_flash_message :notice, :updated
      sign_in(resource_name, resource)
      respond_with resource, :location => after_accept_path_for(resource)
    else
      respond_with_navigational(resource){ render :edit }
    end
  end
private

  def allowed_params
    params.permit(:utf8,:authenticity_token,:invitation_token, :_method, {member:[:invitation_token,:password,:password_confirmation, :name]}, :commit, :action, :controller)
  end
end
