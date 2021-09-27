class AddFieldsToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :studio_manager_id, :uuid
    add_column :studios, :studio_owner_id, :uuid
  end
end
