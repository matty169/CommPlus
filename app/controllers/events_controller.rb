class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :attend_event, :unattend]
  before_filter :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show      # will be default will generate show.html.erb
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        # Very bad coding but when you create an event, you are automatically made an attendee.
        @attendee = Attendee.create(user_id: current_user.id, event_id: @event.id)
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def attend_event
    @event.attend_event(current_user)
  end

  def unattend
    @event.unattend(current_user)
  end

  def request_event
    @event = Event.create(name: "Type Here")
    @attendee = Attendee.create(user_id: current_user.id, event_id: @event.id)
    Attendee.create(user_id: params[:requested_user_id], event_id: @event.id)
    redirect_to edit_event_path(@event)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :time, :location, :description, :photo, :photo_url, :host_id)
    end
end
