class CreateAlphaTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :alpha_teams do |t|
      t.string :firstname
      t.string :lastname
      t.uuid :user_id
      t.date :date_hired
      t.string :department
      t.string :position
      t.string :address
      t.string :contact_number
      t.string :meeting_link
      t.date :birthday
      t.date :last_day
      t.float :pay_rate
      t.float :total_earned
      t.string :employment_contract

      t.timestamps
    end
  end
end
