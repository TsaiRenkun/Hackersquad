class AttendsController < ApplicationController

  def new
  end

  def join

    @attend = Attend.new(attend_params)
    @attend.user = User.find(params[:user_id])
    @attend.event = Event.find(params[:event_id])
    puts @attend.inspect
    puts "AJDSHJKSADHSAJKDHSAJKDSHADJKSAHDSAKJDHSJAKDKSAHDKJSAHDJKAHDKSAJDKHS"
    @attend.save

    redirect_to root_path

  end

  def leave
    @event = Event.find(params[:event_id].to_i)
    @user = current_user

    @event.attends.find_by(user: @user).delete

    respond_to do |format|
        format.js { render :js => "window.location.href = '/'" }
  end
end

  def destory
  end

private
    # Only allow a list of trusted parameters through.
    def attend_params
      params.require(:attend).permit(:user_id, :event_id, :role_id)
    end
end