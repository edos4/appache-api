class CreateStudioOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :studio_owners, id: :uuid do |t|
      t.string :firstname
      t.string :lastname
      t.uuid :user_id
      t.string :mobile_number
      t.string :facebook
      t.string :linkedin
      t.uuid :studio_id

      t.timestamps
    end
  end
end
