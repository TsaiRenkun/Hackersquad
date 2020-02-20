class EventsUsersController < ApplicationController

  def new
  end

  def join
    @event = Event.find(params[:event_id].to_i)
    @user = current_user
    @role = Role.find(params[:role_id].to_i)



    @event.users << @user


    respond_to do |format|
        format.js { render :js => "window.location.href = '/events/#{params[:event_id]}'" }
    end

  end


  def leave
    @event = Event.find(params[:event_id].to_i)
    @user = current_user

    @event.users.delete(@user)

    respond_to do |format|
        format.js { render :js => "window.location.href = '/'" }
  end
end

  def destory
  end

private

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:user_id, :event_id, :role_id)
    end
end