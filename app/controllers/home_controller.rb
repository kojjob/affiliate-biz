class HomeController < ApplicationController
  def index
    @featured_products = Product.featured.limit(6)
    @articles = Article.published.recent.limit(3)
  end
end
