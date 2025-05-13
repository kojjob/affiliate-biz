class ProductCardComponent < ViewComponent::Base
  def initialize(product:)
    @product = product
  end
  
  attr_reader :product
end
