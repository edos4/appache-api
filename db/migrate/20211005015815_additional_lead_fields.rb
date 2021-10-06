class AdditionalLeadFields < ActiveRecord::Migration[6.0]
  def change
    add_column :leads, :studio_id, :uuid
  end
end
