class Api::ArticlesController < ApplicationController
  before_action :validate_params_presence, only: [:create]

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
    category = Category.find_by(name: params[:article][:category])
    article = Article.new(article_params)
    article.category = category
    article.save
    if article.persisted?
      render json: { article: article, message: "Article created successfully" }, status: 201
    else
      render_error(article.errors.full_messages.to_sentence, 422)
    end
  end

  private

  def render_error(message, status)
    render json: { message: message }, status: status
  end

  def article_params
    params[:article].permit(:title, :body)
  end

  def validate_params_presence
    if params[:article].nil?
      render_error("Missing params", :unprocessable_entity)
    elsif params[:article][:title].nil?
      render_error("Title can't be blank", :unprocessable_entity)
    elsif params[:article][:body].nil?
      render_error("Body can't be blank", :unprocessable_entity)
    elsif params[:article][:category].nil?
      render_error("Category can't be blank", :unprocessable_entity)
    end
  end

  def serialize_categories(categories)
    response = {}
    categories.each do |category|
      response[category.name.downcase] = category.articles.as_json
    end
    response
  end
end
