class Api::UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "android", :password => "1234"
  skip_before_filter :verify_authenticity_token
  respond_to :json

  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1.json
  def show      # will be default will generate show.html.erb
  end


  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render :status => 200,
        :json => { :success => true,
                   :info => "User Created",
                   :data => {} }
      else
        render :status => :unprocessable_entity,
          :json => { :success => false,
                     :info => resource.errors,
                     :data => {} }
          end
    end

    # PATCH/PUT /users/1.json
    def update
      if @user.update(user_params)
        render :status => 200,
          :json => { :success => true,
                     :info => "User Updated",
                     :data => {} }
        else
          render :status => :unprocessable_entity,
            :json => { :success => false,
                       :info => resource.errors,
                       :data => {} }
            end
      end

      # DELETE /users/1.json
      def destroy
        @user.destroy
        render :status => 200,
          :json => { :success => true,
                     :info => "User Destroyed",
                     :data => {} }
          end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:name, :description, :photo_url, :description)
      end
    end
