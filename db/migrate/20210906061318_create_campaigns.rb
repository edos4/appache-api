class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :details
      t.string :status
      t.string :attachments
      t.date :start_date
      t.date :end_date
      t.string :tags
      t.float :total_spent
      t.string :fb_leads
      t.string :cpl

      t.timestamps
    end
  end
end
