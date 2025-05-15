class Admin::DashboardController < ApplicationController
  def index
    @recent_articles = Content::Article.order(created_at: :desc).limit(5)
    @recent_products = Product.order(created_at: :desc).limit(5)
  end
end
