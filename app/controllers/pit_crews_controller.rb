class PitCrewsController < ApplicationController
  before_action :set_pit_crew, only: %i[ show edit update destroy ]

  # GET /pit_crews or /pit_crews.json
  def index
    @pit_crews = PitCrew.all
  end

  # GET /pit_crews/1 or /pit_crews/1.json
  def show
  end

  # GET /pit_crews/new
  def new
    @pit_crew = PitCrew.new
  end

  # GET /pit_crews/1/edit
  def edit
  end

  # POST /pit_crews or /pit_crews.json
  def create
    @pit_crew = PitCrew.new(pit_crew_params)

    respond_to do |format|
      if @pit_crew.save
        format.html { redirect_to @pit_crew, notice: "Pit crew was successfully created." }
        format.json { render :show, status: :created, location: @pit_crew }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pit_crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pit_crews/1 or /pit_crews/1.json
  def update
    respond_to do |format|
      if @pit_crew.update(pit_crew_params)
        format.html { redirect_to @pit_crew, notice: "Pit crew was successfully updated." }
        format.json { render :show, status: :ok, location: @pit_crew }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pit_crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pit_crews/1 or /pit_crews/1.json
  def destroy
    @pit_crew.destroy
    respond_to do |format|
      format.html { redirect_to pit_crews_url, notice: "Pit crew was successfully destroyed." }
      format.json { head :no_content }
    end
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
