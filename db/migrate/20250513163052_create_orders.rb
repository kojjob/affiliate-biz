class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :customer_email
      t.string :status
      t.decimal :total_amount

      t.timestamps
    end
    add_index :orders, :customer_email
  end
end
