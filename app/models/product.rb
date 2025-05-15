class Product < ApplicationRecord
  # Associations
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  has_one_attached :image
  has_many :articles

  # Validations
  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :sku, uniqueness: true, allow_blank: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :commission_rate, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :supplier_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :shipping_cost, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :featured_position, numericality: { only_integer: true }, allow_nil: true

  # Scopes
  scope :featured, -> { where(featured: true).order(featured_position: :asc) }
  scope :with_external_url, -> { where.not(external_url: nil) }

  # Callbacks
  before_validation :ensure_slug, on: :create

  # Instance Methods
  def to_param
    slug
  end

  def profit_margin
    return nil unless price.present? && supplier_cost.present?
    ((price - supplier_cost) / price * 100).round(2)
  end

  def total_cost
    return nil unless supplier_cost.present?
    shipping_cost.present? ? supplier_cost + shipping_cost : supplier_cost
  end

  def commission_amount
    return nil unless price.present? && commission_rate.present?
    (price * commission_rate / 100).round(2)
  end

  private

  def ensure_slug
    return if slug.present?

    base_slug = name.parameterize
    slug = base_slug
    counter = 1

    while Product.exists?(slug: slug)
      slug = "#{base_slug}-#{counter}"
      counter += 1
    end

    self.slug = slug
  end
end
