class StudioManagersController < ApplicationController
  before_action :set_studio_manager, only: %i[ show edit update destroy ]

  # GET /studio_managers or /studio_managers.json
  def index
    @studio_managers = StudioManager.all

    render json: @studio_managers
  end

  # GET /studio_managers/1 or /studio_managers/1.json
  def show
    render json: @studio_manager
  end

  # POST /studio_managers or /studio_managers.json
  def create
    @studio_manager = StudioManager.new(studio_manager_params)

    if @studio_manager.save
      render json: @studio_manager, status: :created, location: @studio_manager
    else
      render json: @studio_manager.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studio_managers/1 or /studio_managers/1.json
  def update
    if @studio_manager.update(studio_manager_params)
      render json: @studio_manager
    else
      render json: @studio_manager.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studio_managers/1 or /studio_managers/1.json
  def destroy
    @studio_manager.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studio_manager
      @studio_manager = StudioManager.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def studio_manager_params
      params.require(:studio_manager).permit(:firstname, :lastname, :email, :studio_id, :user_id)
    end
end
