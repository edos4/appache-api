class AlphaTeamsController < ApplicationController
  before_action :set_alpha_team, only: %i[ show edit update destroy ]

  # GET /alpha_teams or /alpha_teams.json
  def index
    @alpha_teams = AlphaTeam.all
    render json: @alpha_teams
  end

  # GET /alpha_teams/1 or /alpha_teams/1.json
  def show
    render json: @alpha_team
  end

  # POST /alpha_teams or /alpha_teams.json
  def create
    @alpha_team = AlphaTeam.new(alpha_team_params)

    if @alpha_team.save
      render json: @alpha_team, status: :created, location: @alpha_team
    else
      render json: @alpha_team.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alpha_teams/1 or /alpha_teams/1.json
  def update
    if @alpha_team.update(alpha_team_params)
      render json: @alpha_team
    else
      render json: @alpha_team.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alpha_teams/1 or /alpha_teams/1.json
  def destroy
    @alpha_team.destroy
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
