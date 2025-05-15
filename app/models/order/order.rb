module Order
  class Order < ApplicationRecord
    include AASM

    has_many :order_items, class_name: "Order::OrderItem"
    has_many :products, through: :order_items, class_name: "Product"

    validates :customer_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    aasm column: "status" do
      state :pending, initial: true
      state :processing
      state :shipped
      state :delivered
      state :canceled

      event :process do
        transitions from: :pending, to: :processing
      end

      event :ship do
        transitions from: :processing, to: :shipped
      end

      event :deliver do
        transitions from: :shipped, to: :delivered
      end

      event :cancel do
        transitions from: [ :pending, :processing ], to: :canceled
      end
    end

    def calculate_total
      order_items.sum { |item| item.price * item.quantity }
    end

    def update_total!
      update(total_amount: calculate_total)
    end
  end
end
