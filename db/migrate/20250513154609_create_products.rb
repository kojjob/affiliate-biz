class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :slug
      t.string :product_type
      t.string :sku
      t.decimal :price

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
