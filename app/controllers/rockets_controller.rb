class RocketsController < ApplicationController
  before_action :set_rocket, only: %i[ show edit update destroy ]

  # GET /rockets or /rockets.json
  def index
    @rockets = Rocket.all
    render json: @rockets
  end

  # GET /rockets/1 or /rockets/1.json
  def show
    render json: @rocket
  end
  # POST /rockets or /rockets.json
  def create
    @rocket = Rocket.new(rocket_params)

    if @rocket.save
      render json: @rocket, status: :created, location: @student
    else
      render json: @rocket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rockets/1 or /rockets/1.json
  def update
    if @rocket.update(rocket_params)
      render json: @rocket
    else
      render json: @rocket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rockets/1 or /rockets/1.json
  def destroy
    @rocket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rocket
      @rocket = Rocket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rocket_params
      params.require(:rocket).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :contact_number, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract)
    end
end
