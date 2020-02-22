class GroupsController < ApplicationController

  def new
  end

  def join
    @attend = Attend.find(params[:attend_id])

    @attend.update(group_params)

    respond_to do |format|
        format.js { render :js => "window.location.href = '/events/#{@group.event_id}'" }
    end
  end

  def leave
    @attendee = Attend.find(params[:attend_id])
    @group = Group.find(params[:group_id])

    @attendee.groups.delete(@group)

    respond_to do |format|
        format.js { render :js => "window.location.href = '/events/#{@group.event_id}'" }
        # format.js { render :js => "window.location.href = '/'" }
  end
end

  def destory
  end



  private
    def group_params
      params.require(:attend).permit(:group_id)
    end

  end