class AddsetItToLeads < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :addset_id, :string
  end
end
