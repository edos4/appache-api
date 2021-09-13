class WolvesComissionsController < ApplicationController
  before_action :set_wolves_comission, only: %i[ show edit update destroy ]

  # GET /wolves_comissions or /wolves_comissions.json
  def index
    @wolves_comissions = WolvesComission.all
    render json: @wolves_comissions
  end

  # GET /wolves_comissions/1 or /wolves_comissions/1.json
  def show
    render json: @wolves_comission
  end
  # POST /wolves_comissions or /wolves_comissions.json
  def create
    @wolves_comission = WolvesComission.new(wolves_comission_params)

    if @wolves_comission.save
      render json: @wolves_comission, status: :created, location: @wolves_comission
    else
      render json: @wolves_comission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wolves_comissions/1 or /wolves_comissions/1.json
  def update
    if @wolves_comission.update(wolves_comission_params)
      render json: @wolves_comission
    else
      render json: @wolves_comission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wolves_comissions/1 or /wolves_comissions/1.json
  def destroy
    @wolves_comission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wolves_comission
      @wolves_comission = WolvesComission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wolves_comission_params
      params.require(:wolves_comission).permit(:total_calls, :actual_conversation, :win_rate, :commissions, :bonus, :total_payout, :wolf_id)
    end
end
