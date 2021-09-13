class CreateLeads < ActiveRecord::Migration[6.1]
  def change
    create_table :leads, id: :uuid do |t|
      t.string :source
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.string :status
      t.text :notes
      t.uuid :assigned
      t.date :sale_date
      t.string :deal
      t.string :deal_status
      t.date :deal_date
      t.float :lbe_price
      t.date :lbe_start_date
      t.uuid :user_id

      t.timestamps
    end
  end
end
