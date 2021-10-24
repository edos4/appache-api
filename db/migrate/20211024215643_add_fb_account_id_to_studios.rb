class AddFbAccountIdToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :fb_account_id, :string
  end
end
