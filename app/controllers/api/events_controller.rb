class Api::EventsController < ApplicationController

  http_basic_authenticate_with :name => "android", :password => "1234"
  before_action :set_event, only: [:show, :update, :destroy]
	skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }

  respond_to :json


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show      # will be default will generate show.html.erb
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

      if @event.save
         render :status => 200,
           :json => { :success => true,
                      :info => "Event Created",
                      :data => {} }
      else
        render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end

  # PATCH/PUT /events/1.json
  def update
      if @event.update(event_params)
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

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    render :status => 200,
           :json => { :success => true,
                      :info => "Event Destroyed",
                      :data => {} }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :time, :location, :description)
    end
end
