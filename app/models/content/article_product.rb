module Content
  class ArticleProduct < ApplicationRecord
    belongs_to :article, class_name: "Content::Article"
    belongs_to :product, class_name: "Product::Item"
  end
end
