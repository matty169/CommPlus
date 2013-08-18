class RegistrationsController < Devise::RegistrationsController
	before_filter :authenticate_user!

def after_register
	# Select the user that has just signed up. This well enable updates on that user.
	@user = current_user
end

def personal

end

def skills

end

  protected

  # This redirect to a path after the user has just
  # recently signed up. This is used so that the 
  # user jump start their user experience.
  def after_sign_up_path_for(resource)
    after_register_path
  end
end