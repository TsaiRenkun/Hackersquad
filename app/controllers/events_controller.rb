class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]
  # before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    if user_signed_in?
    @user = current_user.id
    else
    @events = Event.all
  end
end
  # GET /events/1
  # GET /events/1.json
  def show
    # @profile = current_user.profile
    @event = Event.find(params[:id])
    if user_signed_in?
    @user = current_user.id
    @event = Event.find(params[:id])
    @group = Group.where(event: params[:id])
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    @user_id = current_user.id
  end

  # GET /events/1/edit
  def edit
    # @profile = current_user.profile
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    puts "testing11"
    @event = Event.new(event_params)

    @event.user_id = current_user.id

    @event.save


    event_params[:max_group].to_i.times do |i|
      puts "hello yo"
      Group.create(event: @event, group_number:i+1)
    end

    # redirect_to @event
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
      params.require(:event).permit(:user_id, :name, :description, :date, :location, :img, :max_group, :max_per_group)
    end

    def group_params
       params.require(:group).permit(:event_id, :group_number)
     end
end