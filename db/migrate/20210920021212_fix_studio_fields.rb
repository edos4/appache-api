class FixStudioFields < ActiveRecord::Migration[6.0]
  def change
    remove_column :studios, :location
    remove_column :studios, :abn
  end
end
