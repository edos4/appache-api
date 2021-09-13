class AccountingsController < ApplicationController
  before_action :set_accounting, only: %i[ show edit update destroy ]

  # GET /accountings or /accountings.json
  def index
    @accountings = Accounting.all

    render json: @accountings
  end

  # GET /accountings/1 or /accountings/1.json
  def show
  end

  # POST /accountings or /accountings.json
  def create
    @accounting = Accounting.new(accounting_params)

    if @accounting.save
      render json: @accounting, status: :created, location: @accounting
    else
      render json: @accounting.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accountings/1 or /accountings/1.json
  def update
    if @accounting.update(accounting_params)
      render json: @accounting
    else
      render json: @accounting.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accountings/1 or /accountings/1.json
  def destroy
    @accounting.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting
      @accounting = Accounting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accounting_params
      params.require(:accounting).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :contact_number, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract)
    end
end
