class CampaignsController < ApplicationController
  before_action :set_campaign, only: %i[ show edit update destroy leads]

  def leads
    render json: @campaign.leads
  end

  # GET /campaigns or /campaigns.json
  def index
    @campaigns = Campaign.all

    render json: @campaigns
  end

  # GET /campaigns/1 or /campaigns/1.json
  def show
    render json: @campaign
  end

  # POST /campaigns or /campaigns.json
  def create
    @campaign = Campaign.new(campaign_params)
    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1 or /campaigns/1.json
  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1 or /campaigns/1.json
  def destroy
    @campaign.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_params
      params.require(:campaign).permit(:name, :details, :status, :attachments, :start_date, :end_date, :tags, :total_spent, :fb_leads, :cpl, :fb_campaign_id)
    end
end
