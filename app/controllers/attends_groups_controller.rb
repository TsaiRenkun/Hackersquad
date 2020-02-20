class AttendsGroupsController < ApplicationController

  def new
  end

  def join
    puts "FUCK YOU YOU CCCBNBBB"
    @attendee = Attend.find(params[:attend_id])
    @group = Group.find(params[:group_id])
    @group.attends << @attendee

    respond_to do |format|
        format.js { render :js => "window.location.href = '/events/#{@group.event_id}'" }
    end
  end


  def leave
    @event = Event.find(params[:event_id].to_i)
    @user = current_user

    @event.attends.find_by(user: @user).delete

    respond_to do |format|
        format.js { render :js => "window.location.href = '/'" }
# somegroup.attends.delete(Attend.find_by(user_id:user5))
  end

  def destory
  end

  private

      # Only allow a list of trusted parameters through.
      # def event_params
      #   params.require(:event).permit(:user_id, :event_id, :role_id)
      # end
  end