class AddDropshippingFieldsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :supplier_cost, :decimal
    add_column :products, :shipping_cost, :decimal
  end
end
