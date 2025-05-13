module Product
  class Item < ApplicationRecord
    self.table_name = "products"
    self.inheritance_column = :product_type
    
    has_many :product_categories, class_name: "Product::ProductCategory", foreign_key: "product_id"
    has_many :categories, through: :product_categories, class_name: "Product::Category"
    
    validates :name, presence: true
    validates :slug, uniqueness: true, allow_nil: true
    
    before_validation :generate_slug, if: -> { slug.blank? }
    
    private
    
    def generate_slug
      self.slug = name.parameterize
    end
  end
end
