class Api::AttendeesController < ApplicationController

  http_basic_authenticate_with :name => "android", :password => "1234"
  before_action :set_attendee, only: [:destroy]
  skip_before_filter :verify_authenticity_token,
    :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json



  # POST /attendees
  # POST /attendees.json
  def create
    @attendee = Attendee.new(attendee_params)

    if @attendee.save
      render :status => 200,
        :json => { :success => true,
                   :info => "Attendee Created",
                   :data => {} }
      else
        render :status => :unprocessable_entity,
          :json => { :success => false,
                     :info => resource.errors,
                     :data => {} }
          end
    end

    # DELETE /attendees/1
    # DELETE /attendees/1.json
    def destroy
      @attendee.destroy
      render :status => 200,
        :json => { :success => true,
                   :info => "Attendee Destroyed",
                   :data => {} }
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
