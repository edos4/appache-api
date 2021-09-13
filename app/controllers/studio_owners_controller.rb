class StudioOwnersController < ApplicationController
  before_action :set_studio_owner, only: %i[ show edit update destroy ]

  # GET /studio_owners or /studio_owners.json
  def index
    @studio_owners = StudioOwner.all

    render json: @studio_owner
  end

  # GET /studio_owners/1 or /studio_owners/1.json
  def show
    render json: @studio
  end

  # POST /studio_owners or /studio_owners.json
  def create
    @studio_owner = StudioOwner.new(studio_owner_params)

    if @studio_owner.save
      render json: @studio_owner, status: :created, location: @studio_owner
    else
      render json: @studio_owner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studio_owners/1 or /studio_owners/1.json
  def update
    if @studio_owner.update(studio_owner_params)
      render json: @studio_owner
    else
      render json: @studio_owner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studio_owners/1 or /studio_owners/1.json
  def destroy
    @studio_owner.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_studio_owner
      @studio_owner = StudioOwner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def studio_owner_params
      params.require(:studio_owner).permit(:firstname, :lastname, :user_id, :mobile_number, :facebook, :linkedin, :studio_id)
    end
end
