module Order
  class OrderItem < ApplicationRecord
    belongs_to :order, class_name: "Order::Order"
    belongs_to :product, class_name: "Product::Item", foreign_key: "product_id"
    
    validates :quantity, numericality: { greater_than: 0 }
    validates :price, numericality: { greater_than: 0 }
    
    after_save :update_order_total
    after_destroy :update_order_total
    
    private
    
    def update_order_total
      order.update_total!
    end
  end
end
