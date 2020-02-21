class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [ :show, :index ]


  def index
    @events = Event.all
    if user_signed_in?
    @user = current_user.id
    else
    @events = Event.all
  end
end


  def show
    @event = Event.find(params[:id])
    if user_signed_in?
    @user = current_user.id
    @event = Event.find(params[:id])
    @group = Group.where(event: params[:id])
    end
  end


  def new
    @event = Event.new
    @user_id = current_user.id
  end


  def edit
    @event = Event.find(params[:id])
  end


  def create
    @event = Event.new(event_params)

    @event.user_id = current_user.id

    @event.save

    event_params[:max_group].to_i.times do |i|
      puts "hello yo"
      Group.create(event: @event, group_number:i+1)
    end

    redirect_to @event
  end


  def update
    @event = Event.find(params[:id])

    @event.update(event_params)
    redirect_to @event
  end


  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user_id, :name, :description, :date, :location, :img, :max_group, :max_per_group)
    end

    def group_params
       params.require(:group).permit(:event_id, :group_number)
    end

end