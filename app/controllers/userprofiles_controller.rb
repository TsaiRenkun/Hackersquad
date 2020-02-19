class UserprofilesController < ApplicationController
before_action :authenticate_user!, :except => [ :show, :index ]
  before_action :set_userprofile, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @userprofiles = Userprofile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show

  end

  # GET /profiles/new
  def new
      @userprofile = Userprofile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
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
    # Use callbacks to share common setup or constraints between actions.
    def set_userprofile
      @userprofile = Userprofile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userprofile_params
      params.require(:userprofile).permit(:user, :username, :img, :description)
    end
end
