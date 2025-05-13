class CreateArticleProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :article_products do |t|
      t.references :article, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
