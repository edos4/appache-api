class WolvesController < ApplicationController
  before_action :set_wolf, only: %i[ show edit update destroy ]

  # GET /wolves or /wolves.json
  def index
    @wolves = Wolf.all
    render json: @wolves
  end

  # GET /wolves/1 or /wolves/1.json
  def show
    render json: @wolf
  end

  # POST /wolves or /wolves.json
  def create
    @wolf = Wolf.new(wolf_params)

    if @wolf.save
      render json: @wolf, status: :created, location: @wolf
    else
      render json: @wolf.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wolves/1 or /wolves/1.json
  def update
    if @wolf.update(wolf_params)
      render json: @wolf
    else
      render json: @wolf.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wolves/1 or /wolves/1.json
  def destroy
    @wolf.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wolf
      @wolf = Wolf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wolf_params
      params.require(:wolf).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :contact_number, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract)
    end
end
