class AddStudioIdToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_column :campaigns, :studio_id, :uuid
  end
end