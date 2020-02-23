class GroupsController < ApplicationController

  def show
    @attend = Attend.where(group_id: params[:id]).pluck(:user_id)
    @userprofile = Userprofile.where(user_id: @attend).pluck(:username)
  end

  def new
  end

  def join
    @attend = Attend.find(params[:attend_id])
    @group = Group.find(params[:group_id])
    @attend.update(group: @group)

    respond_to do |format|
        format.js { render :js => "window.location.href = '/events/#{@group.event_id}'" }
    end
  end

  def leave
    @attend = Attend.find(params[:attend_id])
    @attend.update(group: nil)

    respond_to do |format|
        format.js { render :js => "window.location.href = '/events/#{@attend.event_id}'" }
  end
end

  def destory
  end



  private

  end