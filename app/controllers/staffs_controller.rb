class StaffsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_staff, only: %i[ show edit update destroy ]

  # GET /staffs or /staffs.json
  def index
    @staffs = Staff.all
    render json: @staffs
  end

  # GET /staffs/1 or /staffs/1.json
  def show
    render json: @staff
  end
  # POST /staffs or /staffs.json
  def create
    @staff = Staff.new(staff_params)

    if @staff.save
      render json: @staff, status: :created, location: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /staffs/1 or /staffs/1.json
  def update
    if @staff.update(staff_params)
      render json: @staff
    else
      render json: @staff.errors, status: :unprocessable_entity
    end
  end

  # DELETE /staffs/1 or /staffs/1.json
  def destroy
    @staff.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract)
    end
end
