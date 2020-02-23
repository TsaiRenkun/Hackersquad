class GroupsController < ApplicationController
  def show
    @group = Group.where(id: params[:id])
  end
end