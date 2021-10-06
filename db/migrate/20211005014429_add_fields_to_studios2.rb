class AddFieldsToStudios2 < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :phone, :string
    add_column :studios, :services_offered, :string

    add_column :studios, :assigned_rocket, :uuid
    add_column :studios, :assigned_pitcrew, :uuid
    add_column :studios, :assigned_wolf, :uuid
  end
end
