class AddFeaturedToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :featured, :boolean
    add_column :products, :featured_position, :integer
    add_index :products, :featured

  end
end
