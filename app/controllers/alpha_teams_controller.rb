class AlphaTeamsController < ApplicationController
  before_action :set_alpha_team, only: %i[ show edit update destroy ]

  # GET /alpha_teams or /alpha_teams.json
  def index
    @alpha_teams = AlphaTeam.all
  end

  # GET /alpha_teams/1 or /alpha_teams/1.json
  def show
  end

  # GET /alpha_teams/new
  def new
    @alpha_team = AlphaTeam.new
  end

  # GET /alpha_teams/1/edit
  def edit
  end

  # POST /alpha_teams or /alpha_teams.json
  def create
    @alpha_team = AlphaTeam.new(alpha_team_params)

    respond_to do |format|
      if @alpha_team.save
        format.html { redirect_to @alpha_team, notice: "Alpha team was successfully created." }
        format.json { render :show, status: :created, location: @alpha_team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @alpha_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alpha_teams/1 or /alpha_teams/1.json
  def update
    respond_to do |format|
      if @alpha_team.update(alpha_team_params)
        format.html { redirect_to @alpha_team, notice: "Alpha team was successfully updated." }
        format.json { render :show, status: :ok, location: @alpha_team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @alpha_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alpha_teams/1 or /alpha_teams/1.json
  def destroy
    @alpha_team.destroy
    respond_to do |format|
      format.html { redirect_to alpha_teams_url, notice: "Alpha team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alpha_team
      @alpha_team = AlphaTeam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alpha_team_params
      params.require(:alpha_team).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :contact_number, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract)
    end
end
