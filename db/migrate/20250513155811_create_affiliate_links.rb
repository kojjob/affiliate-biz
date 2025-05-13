class CreateAffiliateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :affiliate_links do |t|
      t.integer :product_id
      t.string :destination_url
      t.string :tracking_code
      t.string :program_name

      t.timestamps
    end
    add_index :affiliate_links, :product_id
  end
end
