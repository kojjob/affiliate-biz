class AddFaeturedToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :featured, :boolean
    add_column :articles, :featured_position, :integer
    add_index :articles, :featured
  end
end
