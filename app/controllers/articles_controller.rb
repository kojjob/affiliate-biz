class ArticlesController < ApplicationController
  def index
    @articles = Content::Article.published
                              .includes(:author)
                              .order(published_at: :desc)
                              .page(params[:page])

    @featured_articles = Content::Article.featured.published.limit(3)
  end

  def show
    @article = Content::Article.published.find_by!(slug: params[:id])
    @related_products = @article.products.limit(4)
  rescue ActiveRecord::RecordNotFound
    redirect_to articles_path, alert: "Article not found"
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article.slug), notice: "Article was successfully created."
    else
      render :new
    end
  end

  def edit
    @article = Article.find_by!(slug: params[:id])
  end

  def update
    @article = Article.find_by!(slug: params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article.slug), notice: "Article was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find_by!(slug: params[:id])
    @article.destroy
    redirect_to articles_path, notice: "Article was successfully deleted."
  end

  private

  def article_params
    params.require(:article).permit(:title, :slug, :meta_description, :author, :reading_time, :content, :published, :featured_image, category_ids: [])
  end
end
