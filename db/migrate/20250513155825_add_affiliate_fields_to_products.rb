class AddAffiliateFieldsToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :external_url, :string
    add_column :products, :commission_rate, :decimal
  end
end
