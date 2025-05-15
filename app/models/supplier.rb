class Supplier < ApplicationRecord
  # Associations
  has_many :products, dependent: :nullify

  # Validations
  validates :name, presence: true
  validates :api_key, uniqueness: true, allow_blank: true
  validates :api_url, presence: true, allow_blank: true
end
