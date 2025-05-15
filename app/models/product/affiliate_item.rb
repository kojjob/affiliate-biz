class Product
  def self.AffiliateItem
    Product.where.not(external_url: nil)
  end

  def generate_affiliate_link
    return nil unless tracking_code.present? && external_url.present?

    uri = URI.parse(external_url)
    params = URI.decode_www_form(uri.query || "").to_h
    params["ref"] = tracking_code

    uri.query = URI.encode_www_form(params)
    uri.to_s
  end
end
