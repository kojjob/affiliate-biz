class EnsureArticleSlugs < ActiveRecord::Migration[8.0]
  def up
    unless index_exists?(:articles, :slug)
      add_index :articles, :slug, unique: true
    end
    
    execute <<-SQL
      UPDATE articles 
      SET slug = LOWER(
        REPLACE(
          REPLACE(title, ' ', '-'),
          '''', ''
        )
      )
      WHERE slug IS NULL OR slug = '';
    SQL
  end

  def down
    remove_index :articles, :slug if index_exists?(:articles, :slug)
  end
end