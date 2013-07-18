class Api::AttendeesController < ApplicationController
before_action :set_attendee, only: [:show, :edit, :update, :destroy]
http_basic_authenticate_with :name => "android", :password => "1234"
skip_before_filter :verify_authenticity_token


  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @attendee, notice: 'Attendee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @attendee }
      else
        format.html { render action: 'new' }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee.destroy
    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendee
      @attendee = Attendee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendee_params
      params.require(:attendee).permit(:event_id, :user_id, :skill_id)
    end
end

