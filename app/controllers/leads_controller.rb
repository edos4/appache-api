class LeadsController < ApplicationController
  before_action :authenticate_user!, except: [:lead_signup, :create, :lead_campaign]
  before_action :set_lead, only: %i[ show edit update destroy ]

  def lead_campaign
    puts params.inspect

    p = params
    lead = Lead.create(
      firstname: p['firstname'],
      lastname: p['lastname'],
      email: p['email'],
      phone: p['phone'],
      #campaign_id: p['campaign_id'],
      campaign_name: p['campaign_name'],
      ad_id: p['ad_id'],
      ad_name: p['ad_name'],
      adset_name: p['adset_name'],
      platform: p['platform'],
      is_organic: p['is_organic'],
      integrately_id: p['integrately_id'],
    )

    render json: lead
  end

  # GET /leads or /leads.json
  def index
    @leads = Lead.all

    render json: @leads
  end

  # GET /leads/1 or /leads/1.json
  def show
    render json: @lead
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      render json: @lead, status: :created, location: @lead
    else
      render json: @lead.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    if @lead.update(lead_params)
      render json: @lead
    else
      render json: @lead.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy
  end

  def lead_signup
    @lead = Lead.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.require(:lead).permit(:email, :ad_name, :ad_id, :adset_name, :platform, :is_organic, :integrately_id, :campaign_id, :campaign_name, :source, :firstname, :lastname, :phone, :status, :notes, :assigned, :sale_date, :deal, :deal_status, :deal_date, :lbe_price, :lbe_start_date, :user_id)
    end
end
