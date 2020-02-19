class EventsUsersController < ApplicationController

  def new
  end

  def join
    @event = Event.find(params[:event_id].to_i)
    @user = current_user


    @event.users << @user

    redirect_to @event
  end

  def destory
  end

private

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user_id, :event_id)
    end
end