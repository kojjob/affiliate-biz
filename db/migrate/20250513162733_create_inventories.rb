class CreateInventories < ActiveRecord::Migration[8.0]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :quantity
      t.string :sku
      t.integer :supplier_id

      t.timestamps
    end
    add_index :inventories, :product_id
    add_index :inventories, :supplier_id
  end
end
