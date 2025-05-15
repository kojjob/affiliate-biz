class Product
  def self.DropshipItem
    Product.where.not(supplier_cost: nil)
  end

  def profit_percentage
    return nil unless profit_margin.present?
    profit_margin / 100.0
  end

  def total_inventory
    0 # Placeholder until we implement inventory tracking
  end

  def in_stock?
    true # Placeholder until we implement inventory tracking
  end
end
