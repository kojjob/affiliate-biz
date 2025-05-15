module Marketing
  class AffiliateLink < ApplicationRecord
    belongs_to :product
    has_many :clicks, dependent: :nullify
    has_many :conversions, dependent: :nullify

    validates :destination_url, presence: true
    validates :tracking_code, presence: true
  end
end
