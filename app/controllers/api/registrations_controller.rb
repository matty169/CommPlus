
# Registration
# curl -v -H 'Content-Type: application/json' -H 'Accept: application/json' -X POST http://localhost:3000/api/registrations -d "{\"user\":{\"email\":\"user1@example.com\",\"name\":\"anotheruser\",\"password\":\"secret\",\"password_confirmation\":\"secret\"}}"


class Api::RegistrationsController < Devise::RegistrationsController

  http_basic_authenticate_with :name => "android", :password => "1234"
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in resource
      render :status => 200,
           :json => { :success => true,
                      :info => "Registered",
                      :data => { :auth_token => current_user.authentication_token, id: current_user.id } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end
end