require 'rails_helper'

RSpec.describe "Admin::Articles", type: :request do
  let(:article) { create(:article) }

  describe "GET /admin/articles" do
    it "returns http success" do
      get "/admin/articles"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /admin/articles/new" do
    it "returns http success" do
      get "/admin/articles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /admin/articles" do
    it "creates a new article" do
      article_params = {
        article: {
          title: "Test Article",
          content: "Test content",
          published: true
        }
      }
      expect {
        post "/admin/articles", params: article_params
      }.to change(Content::Article, :count).by(1)
      expect(response).to redirect_to(admin_articles_path)
    end
  end

  describe "GET /admin/articles/:id/edit" do
    it "returns http success" do
      get "/admin/articles/#{article.id}/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /admin/articles/:id" do
    it "updates the article" do
      patch "/admin/articles/#{article.id}", params: {
        article: { title: "Updated Title" }
      }
      expect(response).to redirect_to(admin_articles_path)
      article.reload
      expect(article.title).to eq("Updated Title")
    end
  end

  describe "DELETE /admin/articles/:id" do
    it "destroys the article" do
      article # Create the article
      expect {
        delete "/admin/articles/#{article.id}"
      }.to change(Content::Article, :count).by(-1)
      expect(response).to redirect_to(admin_articles_path)
    end
  end
end
