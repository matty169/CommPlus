class Api::SkillsController < ApplicationController
 before_action :set_skill, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "android", :password => "1234"
    skip_before_filter :verify_authenticity_token


  # POST /skills
  # POST /skills.json
  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render action: 'show', status: :created, location: @skill }
      else
        format.html { render action: 'new' }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skills/1
  # DELETE /skills/1.json
  def destroy
    @skill.destroy
    respond_to do |format|
      format.html { redirect_to skills_url }
      format.json { head :no_content }
    end
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

