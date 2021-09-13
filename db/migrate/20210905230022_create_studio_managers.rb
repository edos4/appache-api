class CreateStudioManagers < ActiveRecord::Migration[6.0]
  def change
    create_table :studio_managers do |t|
      t.string :firstname
      t.string :lastname
      t.uuid :studio_id
      t.uuid :user_id

      t.timestamps
    end
  end
end
