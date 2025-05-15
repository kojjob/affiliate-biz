module Content
  class Article < ApplicationRecord
    self.table_name = "articles"

    belongs_to :author, class_name: "User", optional: true
    has_many :article_products
    has_many :products, through: :article_products

    has_rich_text :content
    has_one_attached :featured_image

    scope :published, -> { where(published: true) }
    scope :featured, -> { where(featured: true).order(featured_position: :desc) }
    scope :recent, -> { order(published_at: :desc) }

    validates :title, presence: true
    validates :slug, presence: true, uniqueness: true

    before_validation :generate_slug, on: :create

    def to_param
      slug
    end

    private

    def generate_slug
      self.slug = title.parameterize if slug.blank? && title.present?
    end
  end
end
