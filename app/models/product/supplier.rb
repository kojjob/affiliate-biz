module Product
  class Supplier < ApplicationRecord
    has_many :dropship_items, class_name: "Product::DropshipItem", foreign_key: "supplier_id"
    has_many :inventories, class_name: "Product::Inventory"

    validates :name, presence: true
    validates :api_key, presence: true, if: -> { api_url.present? }
  end
end
