class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :skills]
  before_filter :authenticate_user!

  
  def index
    @users = User.all   # the sort works.
    # @users_skill_match = User.skill_match
    # @users_recommended = User.recommed
  end

  # GET /users/1
  # GET /users/1.json
  def show      # will be default will generate show.html.erb
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  # This starts the json builder to render the D3 graphics.
  def skills
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :description, :photo, :phot_url, :is_male, :location, :skills_attributes => [:id, :name, :user_id, :teach, :_destroy] )
    end
end