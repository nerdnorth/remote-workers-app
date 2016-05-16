class AddChargebeeTable < ActiveRecord::Migration
  def change
     create_table :chargebee_subscriptions do |t|
      t.string :event_id
      t.string :invoice_id
      t.string :subscription_id
      t.string :customer_id
      t.string :customer_email
      t.string :plan_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
