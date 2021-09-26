class AddCampaignIdToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :campaign_id, :uuid
  end
end
