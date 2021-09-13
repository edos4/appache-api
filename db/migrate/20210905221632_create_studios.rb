class CreateStudios < ActiveRecord::Migration[6.0]
  def change
    create_table :studios, id: :uuid do |t|
      t.string :name
      t.string :location
      t.string :email
      t.string :address
      t.string :abn

      t.timestamps
    end
  end
end
