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
    @attendee = Attend.find(params[:attend_id])
    @group = Group.find(params[:group_id])

    @attendee.groups.delete(@group)

    respond_to do |format|
        format.js { render :js => "window.location.href = '/'" }
  end
end

  def destory
  end

  private

      # Only allow a list of trusted parameters through.
      # def event_params
      #   params.require(:event).permit(:user_id, :event_id, :role_id)
      # end
  end