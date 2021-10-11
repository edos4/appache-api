class LeadSerializer < ActiveModel::Serializer
  attributes :id, :source, :firstname,:lastname,:phone,:status,:notes,:assigned,:sale_date,:deal,:deal_status,:deal_date,:lbe_price,:lbe_start_date,:user_id,:created_at,:updated_at,:campaign_name,:campaign_id,:ad_name,:ad_id,:adset_name,:platform,:is_organic,:integrately_id,:email,:studio_id,:fb_campaign_id, :campaign_details

  def campaign_details
    object.campaign
  end
end
