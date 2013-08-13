class Api::SkillsController < ApplicationController

  http_basic_authenticate_with :name => "android", :password => "1234"
  before_action :set_skill, only: [:update, :destroy]
  skip_before_filter :verify_authenticity_token
  respond_to :json

  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)
    if @skill.save
      render :status => 200,
        :json => { :success => true,
                   :info => "Skill Created",
                   :data => {} }
      else
        render :status => :unprocessable_entity,
          :json => { :success => false,
                     :info => resource.errors,
                     :data => {} }
          end
    end

    # PATCH/PUT /skills/1.json
    def update
      if @skill.update(skill_params)
        render :status => 200,
          :json => { :success => true,
                     :info => "Event Updated",
                     :data => {} }
        else
          render :status => :unprocessable_entity,
            :json => { :success => false,
                       :info => resource.errors,
                       :data => {} }
            end
      end

      # DELETE /skills/1.json
      def destroy
        @skill.destroy
        render :status => 200,
          :json => { :success => true,
                     :info => "Skill Destroyed",
                     :data => {} }
          end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_skill
        @skill = Skill.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def skill_params
        params.require(:skill).permit(:teach, :name, :description)
      end
    end
