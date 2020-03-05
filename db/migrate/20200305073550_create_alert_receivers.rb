class CreateAlertReceivers < ActiveRecord::Migration[5.2]
  def change
    create_table :alert_receivers do |t|
      t.integer :user_id
      t.text :browser_id

      t.timestamps
    end
  end
end
