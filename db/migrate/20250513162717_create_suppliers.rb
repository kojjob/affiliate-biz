class CreateSuppliers < ActiveRecord::Migration[8.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :api_key
      t.string :api_url

      t.timestamps
    end
  end
end
