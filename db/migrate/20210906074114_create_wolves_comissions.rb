class CreateWolvesComissions < ActiveRecord::Migration[6.0]
  def change
    create_table :wolves_comissions do |t|
      t.integer :total_calls
      t.integer :actual_conversation
      t.float :win_rate
      t.float :commissions
      t.float :bonus
      t.float :total_payout
      t.uuid :wolf_id

      t.timestamps
    end
  end
end
