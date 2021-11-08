class AddStudioJsonToStaff < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :studios, :jsonb
  end
end
