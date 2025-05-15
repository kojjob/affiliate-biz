class Inventory < ApplicationRecord
  # Associations
  belongs_to :product
  belongs_to :supplier

  # Validations
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :sku, presence: true
end
