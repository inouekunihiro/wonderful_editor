class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(updated_at: :desc)
    render json: @articles, each_serializer: Api::V1::ArticlePreviewSerializer # 複数は each_serializer: 、これでブラウザでJSON形式で表示させることができる
  end

  def show
    @article = Article.find(params[:id])
    render json: @article, serializer: Api::V1::ArticleSerializer
  end

  def create
  end

  def update
  end

  def destory
  end
end
