class StudiosController < ApplicationController
  before_action :authenticate_user!, except: [:studio_signup, :create]
  before_action :set_studio, only: %i[ show edit update destroy ]

  # GET /studios or /studios.json
  def index
    @studios = Studio.all

    render json: @studios
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