class UserprofilesController < ApplicationController
before_action :authenticate_user!, :except => [ :show, :index ]

  def index
    @userprofiles = Userprofile.all
  end

  def show
    if Userprofile.find_by(user_id: params[:id])
    @userprofile = Userprofile.find_by(user_id: params[:id])
  else
    redirect_to new_userprofile_path
  end
end

  def new
      @userprofile = Userprofile.new
  end

  def edit
  end

  def create
  	puts 'print user error here:'
  	puts userprofile_params
    @userprofile = Userprofile.new(userprofile_params)

    @userprofile.user = current_user

    @userprofile.save
    redirect_to @userprofile
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @userprofile.update(profile_params)
        format.html { redirect_to @userprofile, notice: 'Userprofile was successfully updated.' }
        format.json { render :show, status: :ok, location: @userprofile }
      else
        format.html { render :edit }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @userprofile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Userprofile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def userprofile_params
      params.require(:userprofile).permit(:user, :username, :img, :description)
    end
end