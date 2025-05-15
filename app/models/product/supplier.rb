class Supplier < ApplicationRecord
  # Associations
  has_many :products, class_name: "Product", foreign_key: "supplier_id", dependent: :nullify

  # Validations
  validates :name, presence: true
  validates :api_key, presence: true, uniqueness: true, allow_blank: true
  validates :api_url, presence: true, allow_blank: true
end
