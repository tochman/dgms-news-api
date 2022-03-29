class Api::ArticlesController < ApplicationController
  def index
    categories = Category.all.includes(:articles)
    response = serialize_categories(categories)
    render json: { articles: response }
  end

  private

  def serialize_categories(categories)
    response = {}
    categories.each do |category|
      response[category.name.downcase] = category.articles.as_json
    end
    response
  end
end
