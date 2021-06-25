class Api::V1::ArticlesController < Api::V1::BaseApiController
  before_action :set_article, only: [:show]

  def index
    @articles = Article.all.order(updated_at: :desc)
    render json: @articles, each_serializer: Api::V1::ArticlePreviewSerializer # 複数は each_serializer: 、これでブラウザでJSON形式で表示させることができる
  end

  def show
    # @article = Article.find(params[:id])
    render json: @article, serializer: Api::V1::ArticleSerializer
  end

  def create
    # @article = Article.new(
    #   title: params[:title],
    #   body: params[:body],
    #   user_id: current_user.id
    # )

    @article = current_user.articles.create!(article_params)
    render json: @article, serializer: Api::V1::ArticleSerializer
  end

  def update
  end

  def destory
  end

  private

    def article_params
      params.require(:article).permit(:title, :body)
    end

  # def set_article
  #   @article = Article.find(params[:id])
  # end
end
