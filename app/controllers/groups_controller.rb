class GroupsController < ApplicationController

  def show
    @user = current_user.id
    @groupid = params[:id]
    @attend = Attend.where(group_id: params[:id]).pluck(:user_id)
    @userprofile = Userprofile.where(user_id: @attend).pluck(:username)
    @comment = Comment.where(group_id: params[:id])
    @userlist = User.all
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

  def create
    @user = current_user.id
    @comment = Comment.new(message_params)
    puts "comment ran"
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  private

  def message_params
     params.require(:text).permit(:group_id, :user_id, :comment)
  end

  end