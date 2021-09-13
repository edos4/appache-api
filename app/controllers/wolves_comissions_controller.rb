class WolvesComissionsController < ApplicationController
  before_action :set_wolves_comission, only: %i[ show edit update destroy ]

  # GET /wolves_comissions or /wolves_comissions.json
  def index
    @wolves_comissions = WolvesComission.all
  end

  # GET /wolves_comissions/1 or /wolves_comissions/1.json
  def show
  end

  # GET /wolves_comissions/new
  def new
    @wolves_comission = WolvesComission.new
  end

  # GET /wolves_comissions/1/edit
  def edit
  end

  # POST /wolves_comissions or /wolves_comissions.json
  def create
    @wolves_comission = WolvesComission.new(wolves_comission_params)

    respond_to do |format|
      if @wolves_comission.save
        format.html { redirect_to @wolves_comission, notice: "Wolves comission was successfully created." }
        format.json { render :show, status: :created, location: @wolves_comission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wolves_comission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wolves_comissions/1 or /wolves_comissions/1.json
  def update
    respond_to do |format|
      if @wolves_comission.update(wolves_comission_params)
        format.html { redirect_to @wolves_comission, notice: "Wolves comission was successfully updated." }
        format.json { render :show, status: :ok, location: @wolves_comission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wolves_comission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wolves_comissions/1 or /wolves_comissions/1.json
  def destroy
    @wolves_comission.destroy
    respond_to do |format|
      format.html { redirect_to wolves_comissions_url, notice: "Wolves comission was successfully destroyed." }
      format.json { head :no_content }
    end
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
