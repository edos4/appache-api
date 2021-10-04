class AddStaffFields < ActiveRecord::Migration[6.0]
  def change
    add_column :staffs, :title, :string
    add_column :staffs, :job_description, :string
    add_column :staffs, :email, :string
    add_column :staffs, :status, :string
    add_column :staffs, :role, :string
    add_column :staffs, :contact_number, :string
  end
end
