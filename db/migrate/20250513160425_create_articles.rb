class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :slug
      t.string :meta_title
      t.string :meta_description
      t.boolean :published

      t.timestamps
    end
    add_index :articles, :slug, unique: true
  end
end
