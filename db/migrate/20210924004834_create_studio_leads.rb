class CreateStudioLeads < ActiveRecord::Migration[6.0]
  def change
    create_table :studio_leads, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :studio_id
    end
  end
end
