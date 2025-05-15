class Admin::ArticlesController < ApplicationController
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]

  def index
    @articles = Content::Article.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @article = Content::Article.new
  end

  def create
    @article = Content::Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: "Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to admin_articles_path, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_articles_path, notice: "Article was successfully destroyed."
  end

  private

  def set_article
    @article = Content::Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :meta_title, :meta_description, :published, :featured, :featured_position, :slug)
  end
end
