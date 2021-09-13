class AddFieldsToLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :campaign_name, :string
    add_column :leads, :campaign_id, :uuid
    add_column :leads, :ad_name, :string
    add_column :leads, :ad_id, :string
    add_column :leads, :adset_name, :string
    add_column :leads, :platform, :string
    add_column :leads, :is_organic, :boolean, default: false
    add_column :leads, :integrately_id, :string
  end
end
