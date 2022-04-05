class Api::ArticlesController < ApplicationController

  def index
    categories = Category.all.includes(:articles)
    response = serialize_categories(categories)
    render json: { articles: response }
  end

  def show
    article = Article.find(params[:id])
    render json: { article: article }
  end

  def create
    new_article = Article.create(params[:article].permit!)
    binding.pry
    # Here you need to check if the article was created or not
    render json: { article: new_article }, status: 201
  end

  private

  def article_params
    params[:article].permit(:title, :body)
  end

  def serialize_categories(categories)
    response = {}
    categories.each do |category|
      response[category.name.downcase] = category.articles.as_json
    end
    response
  end

end
