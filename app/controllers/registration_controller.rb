class RegistrationController < Devise::RegistrationsController
	prepend_before_filter :require_no_authentication, :except => [ :index, :edit, :update, :destroy ]
	prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

	def index
		@users = User.all
	end

	def new
		build_resource({})
		respond_with self.resource
	end

	def create
		build_resource(sign_up_params)
		@group = Group.new
		@group.role = "user"

		resource.group = @group

	    if resource.save
	      yield resource if block_given?
	      if resource.active_for_authentication?
	        set_flash_message :notice, :signed_up if is_flashing_format?
	        sign_up(resource_name, resource)
	        respond_with resource, :location => after_sign_up_path_for(resource)
	      else
	        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
	        expire_data_after_sign_in!
	        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
	      end
	    else
	      clean_up_passwords resource
	      respond_with resource
	    end
	end
end
