class ArticlesController < ApplicationController
  def index
    @articles = Content::Article.published.page(params[:page]).per(10)
  end

  def show
    @article = Content::Article.published.find_by!(slug: params[:id])
    @related_products = @article.products.limit(4)
  end
end
