class Api::ArticlesController < ApiController
  before_action :set_article, only: [:show, :update, :destroy, :edit]

  def index
    @articles = Article.all
    render json: Article.all.to_json()
  end

  def show
    render json: @article.to_json()
  end

  #def new
   # @article = Article.new
  #end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    render json: @article, status: :ok
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:article, :title, :body, :status)
    end
end
