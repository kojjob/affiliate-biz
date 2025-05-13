module Product
  class Inventory < ApplicationRecord
    belongs_to :product, class_name: "Product::DropshipItem"
    belongs_to :supplier, class_name: "Product::Supplier"
    
    validates :quantity, numericality: { greater_than_or_equal_to: 0 }
    validates :sku, presence: true
  end
end
