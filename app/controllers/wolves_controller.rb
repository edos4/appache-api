class WolvesController < ApplicationController
  before_action :set_wolf, only: %i[ show edit update destroy ]

  # GET /wolves or /wolves.json
  def index
    @wolves = Wolf.all
  end

  # GET /wolves/1 or /wolves/1.json
  def show
  end

  # GET /wolves/new
  def new
    @wolf = Wolf.new
  end

  # GET /wolves/1/edit
  def edit
  end

  # POST /wolves or /wolves.json
  def create
    @wolf = Wolf.new(wolf_params)

    respond_to do |format|
      if @wolf.save
        format.html { redirect_to @wolf, notice: "Wolf was successfully created." }
        format.json { render :show, status: :created, location: @wolf }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wolf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wolves/1 or /wolves/1.json
  def update
    respond_to do |format|
      if @wolf.update(wolf_params)
        format.html { redirect_to @wolf, notice: "Wolf was successfully updated." }
        format.json { render :show, status: :ok, location: @wolf }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wolf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wolves/1 or /wolves/1.json
  def destroy
    @wolf.destroy
    respond_to do |format|
      format.html { redirect_to wolves_url, notice: "Wolf was successfully destroyed." }
      format.json { head :no_content }
    end
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
