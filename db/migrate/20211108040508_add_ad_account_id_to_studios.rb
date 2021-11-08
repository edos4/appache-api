class AddAdAccountIdToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :ad_account_id, :string
  end
end
