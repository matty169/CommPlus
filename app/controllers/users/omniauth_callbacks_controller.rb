class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
      user = User.from_omniauth(request.env["omniauth.auth"])
      if user.persisted?    # probably checks if all the fields are valid
        sign_in_and_redirect user
        else
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_url
      end
  end

  alias_method :twitter, :all
end