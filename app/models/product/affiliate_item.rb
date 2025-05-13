module Product
  class AffiliateItem < Item
    has_many :affiliate_links, class_name: "Marketing::AffiliateLink", foreign_key: "product_id"

    validates :external_url, presence: true

    def generate_affiliate_link
      # Logic to generate properly formatted affiliate link
      "\#{external_url}?ref=\#{tracking_code}"
    end
  end
end
