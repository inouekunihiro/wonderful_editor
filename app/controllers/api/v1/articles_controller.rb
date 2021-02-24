class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
  end

  def create
  end

  def update
  end

  def destory
  end
end
