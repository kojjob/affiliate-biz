module Product
  class DropshipItem < Item
    belongs_to :supplier, class_name: "Product::Supplier", optional: true
    has_many :inventories, class_name: "Product::Inventory", foreign_key: "product_id"
    
    validates :sku, presence: true, uniqueness: true
    
    def profit_margin
      price - (supplier_cost + shipping_cost)
    end
    
    def profit_percentage
      profit_margin / price
    end
    
    def total_inventory
      inventories.sum(:quantity)
    end
    
    def in_stock?
      total_inventory > 0
    end
  end
end
