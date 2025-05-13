module Marketing
  class AffiliateLink < ApplicationRecord
    belongs_to :product, class_name: "Product::AffiliateItem"
    
    validates :destination_url, presence: true
    validates :tracking_code, presence: true
  end
end
