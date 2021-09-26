class StudiosController < ApplicationController
  before_action :authenticate_user!, except: [:studio_signup, :create, :import_studios_overview]
  before_action :set_studio, only: %i[ show edit update destroy ]

  # GET /studios or /studios.json
  def index
    @studios = Studio.all

    render json: @studios
  end

  def import_studios_overview
    Studio.destroy_all
    Campaign.destroy_all
    c = []

    @data = GsheetService.call("1YK0SQvNXWHEoSMMG-7V6wl_3XKz-44UrH4JoL7bJXKk", "Studios Overview", "", "")
    @data.shift
    @data.shift

    @data.each do |d|
      studio = Studio.create!(
        name: d[0],
        address: d[4],
        email: d[7]
      )

      #lead = Lead.find_or_create_by(email: "pday@f45training.com.au", name: d[4]) not all leads have email

      campaign = Campaign.find_or_create_by!(name: d[18])

      studio.update!(campaign_id: campaign.id)
    end
  end

  # GET /studios/1 or /studios/1.json
  def show
    render json: @studio
  end

  # POST /studios or /studios.json
  def create
    @studio = Studio.new(studio_params.except(:owner_firstname, :owner_lastname, :owner_email, :mobile_number, :facebook, :linkedin, :studio_manager_firstname, :studio_manager_lastname, :studio_manager_email))

    if @studio.save
      owner_user = User.create!(
        email: studio_params[:owner_email], 
        password: "!!asd98734***xcv__edpogi"
      )

      manager_user = User.create!(
        email: studio_params[:studio_manager_email], 
        password: "!!asd98734***xcv__edpogi"
      )

      studio_manager = StudioManager.create!(
        firstname: studio_params[:studio_manager_firstname], 
        lastname: studio_params[:studio_manager_lastname],
        studio_id: @studio.id,
        user_id: manager_user.id
      )

      studio_owner = StudioOwner.create!(
        firstname: studio_params[:owner_firstname],
        lastname: studio_params[:owner_lastname],
        mobile_number: studio_params[:mobile_number],
        facebook: studio_params[:facebook],
        linkedin: studio_params[:linkedin],
        studio_id: @studio.id,
        user_id: owner_user.id
      )

      render json: @studio
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studios/1 or /studios/1.json
  def studio
    if @student.update(studio_params)
      render json: @studio
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studios/1 or /studios/1.json
  def destroy
    @studio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studio
      @studio = Studio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def studio_params
      params.require(:studio).permit(:name, :location, :email, :address, :abn, :owner_firstname, :owner_lastname, :owner_email, :mobile_number, :facebook, :linkedin, :studio_manager_firstname, :studio_manager_lastname, :studio_manager_email)
    end
end
