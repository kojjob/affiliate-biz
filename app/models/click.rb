class Click < ApplicationRecord
  belongs_to :affiliate_link, class_name: "Marketing::AffiliateLink", optional: true
end
