class Conversion < ApplicationRecord
  belongs_to :affiliate_link, class_name: "Marketing::AffiliateLink", optional: true
  belongs_to :click, optional: true
end
