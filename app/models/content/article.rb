module Content
  class Article < ApplicationRecord
    has_many :article_products, class_name: "Content::ArticleProduct"
    has_many :products, through: :article_products, class_name: "Product::Item"

    validates :title, :content, presence: true
    validates :slug, uniqueness: true, allow_nil: true

    before_validation :generate_slug, if: -> { slug.blank? }

    scope :published, -> { where(published: true) }

    private

    def generate_slug
      self.slug = title.parameterize
    end
  end
end
