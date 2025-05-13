module Order
  class OrderProcessorService
    def self.call(order)
      # In MVP, just log the processing - will expand later
      Rails.logger.info "Processing order: \#{order.id} for \#{order.customer_email}"
      
      # Check inventory availability
      dropship_items = order.order_items.map(&:product).select { |p| p.is_a?(Product::DropshipItem) }
      
      dropship_items.each do |item|
        unless item.in_stock?
          Rails.logger.error "Item \#{item.id} out of stock for order \#{order.id}"
          return false
        end
      end
      
      # Process the order
      order.process!
      
      # Later will implement actual supplier API integration
      true
    end
  end
end
