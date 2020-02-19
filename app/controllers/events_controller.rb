class EventsController < ApplicationController
  # before_action :authenticate_user!, :except => [ :show, :index ]
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    # @profile = current_user.profile
  end

  # GET /events/1
  # GET /events/1.json
  def show
    # @profile = current_user.profile
    @event = Event.find(params[:id])

  end

  # GET /events/new
  def new
    @event = Event.new
    # @profile = current_user.profile
  end

  # GET /events/1/edit
  def edit
    # @profile = current_user.profile
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    @event.user = current_user

    @event.save
    redirect_to @event
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    @event.update(event_params)
    redirect_to @event
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user, :name, :description, :date, :location, :img, :max_group, :max_per_group)
    end
end