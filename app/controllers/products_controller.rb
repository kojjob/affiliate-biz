class ProductsController < ApplicationController
  def index
    @products = Product::Item.all.page(params[:page]).per(12)
  end
  
  def show
    @product = Product::Item.find_by!(slug: params[:id])
    @related_articles = @product.articles.published.limit(3)
  end
end
