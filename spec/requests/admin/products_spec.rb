require 'rails_helper'

RSpec.describe "Admin::Products", type: :request do
  let(:product) { create(:product) }

  describe "GET /admin/products" do
    it "returns http success" do
      get "/admin/products"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/products/new" do
    it "returns http success" do
      get "/admin/products/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /admin/products" do
    it "creates a new product" do
      product_params = {
        product: {
          name: "Test Product",
          description: "Test description",
          price: 99.99,
          product_type: "Product::AffiliateItem",
          external_url: "https://example.com"
        }
      }
      expect {
        post "/admin/products", params: product_params
      }.to change(Product, :count).by(1)
      expect(response).to redirect_to(admin_products_path)
    end
  end

  describe "GET /admin/products/:id/edit" do
    it "returns http success" do
      get "/admin/products/#{product.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /admin/products/:id" do
    it "updates the product" do
      patch "/admin/products/#{product.id}", params: {
        product: { name: "Updated Product" }
      }
      expect(response).to redirect_to(admin_products_path)
      product.reload
      expect(product.name).to eq("Updated Product")
    end
  end

  describe "DELETE /admin/products/:id" do
    it "destroys the product" do
      product # Create the product
      expect {
        delete "/admin/products/#{product.id}"
      }.to change(Product, :count).by(-1)
      expect(response).to redirect_to(admin_products_path)
    end
  end
end
