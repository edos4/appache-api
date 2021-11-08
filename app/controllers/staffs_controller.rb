class StaffsController < ApplicationController
  before_action :authenticate_user!, except: [:import_team]
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
      user = User.create!(
        email: params["staff"]["email"],
        password: "12312asasdwq@2132124a"
      )

      @staff.update(user_id: user.id)

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

  def import_team
    Staff.all.each do |s|
      s.user.destroy if s.user.present?
      s.destroy
    end

    @data = GsheetService.call("1YK0SQvNXWHEoSMMG-7V6wl_3XKz-44UrH4JoL7bJXKk", "Team Info - Apache", "", "")
    @data.shift
    @data.each do |d|
      user = User.create!(
        email: d[6],
        password: "12312asasdwq@2132124a"
      )

      staff = Staff.create!(
        firstname: d[0],
        lastname: d[1],
        date_hired: d[2],
        role: d[3],
        title: d[4],
        job_description: d[5],
        email: d[6],
        contact_number: d[7],
        meeting_link: d[8],
        birthday: d[9],
        status: d[10],
        user_id: user.id
      )
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staff
      @staff = Staff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def staff_params
      params.require(:staff).permit(:firstname, :lastname, :user_id, :date_hired, :department, :position, :address, :meeting_link, :birthday, :last_day, :pay_rate, :total_earned, :employment_contract, :title, :job_description, :email, :contact_number, :status, :role, :studios, :studios => [])
    end
end
