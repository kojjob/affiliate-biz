class EnsureProductSlugs < ActiveRecord::Migration[8.0]
  def up
    # Add index if it doesn't exist
    unless index_exists?(:products, :slug)
      add_index :products, :slug, unique: true
    end

    # Generate slugs for products without them
    execute <<-SQL
      UPDATE products#{' '}
      SET slug = LOWER(
        REPLACE(
          REPLACE(name, ' ', '-'),
          '''', ''
        )
      )
      WHERE slug IS NULL OR slug = '';
    SQL
  end

  def down
    remove_index :products, :slug if index_exists?(:products, :slug)
  end
end
