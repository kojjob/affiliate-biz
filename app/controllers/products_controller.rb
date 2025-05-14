class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.includes(:categories)
                      .order(created_at: :desc)
                      .page(params[:page])
    
    respond_to do |format|
      format.html
      format.json { render json: { 
        products: @products,
        total_pages: @products.total_pages,
        current_page: @products.current_page
      }}
    end
  end

  def show
    @related_products = @product.categories.flat_map(&:products)
                               .uniq
                               .reject { |p| p.id == @product.id }
                               .first(3)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully deleted.'
  end

  private

  def set_product
    @product = Product.includes(:categories)
                     .find_by!(slug: params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: 'Product not found'
  end

  def product_params
    params.require(:product).permit(
      :name, 
      :description, 
      :price, 
      :sku, 
      :external_url,
      :commission_rate,
      :supplier_cost,
      :shipping_cost,
      :featured,
      :featured_position,
      category_ids: []
    )
  end
end
