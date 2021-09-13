class PitCrewsController < ApplicationController
  before_action :set_pit_crew, only: %i[ show edit update destroy ]

  # GET /pit_crews or /pit_crews.json
  def index
    @pit_crews = PitCrew.all
    render json: @pit_crews
  end

  # GET /pit_crews/1 or /pit_crews/1.json
  def show
    render json: @pit_crew
  end

  # POST /pit_crews or /pit_crews.json
  def create
    @pit_crew = PitCrew.new(pit_crew_params)

    if @pit_crew.save
      render json: @pit_crew, status: :created, location: @pit_crew
    else
      render json: @pit_crew.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pit_crews/1 or /pit_crews/1.json
  def update
    if @pit_crew.update(pit_crew_params)
      render json: @pit_crew
    else
      render json: @pit_crew.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pit_crews/1 or /pit_crews/1.json
  def destroy
    @pit_crew.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pit_crew
      @pit_crew = PitCrew.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pit_crew_params
      params.require(:pit_crew).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :contact_number, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract)
    end
end
