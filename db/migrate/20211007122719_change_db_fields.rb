class ChangeDbFields < ActiveRecord::Migration[6.0]
  def change
    change_column :staffs, :birthday, :string
    change_column :staffs, :date_hired, :string

    add_column :studios, :account_id, :string

    add_column :campaigns, :fb_campaign_id, :string

    add_column :leads, :fb_campaign_id, :string    
  end
end
