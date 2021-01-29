class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy, :edit]

  def index
    @articles = Article.all
    respond_to do |format|
      format.html{ render :index }
    end
  end

  def show
  end

  def new
    #@article = Article.new
  end

  def create
    #@article = Article.new(article_params)
    #
    #respond_to do |format|
    #  if @article.save
    #    format.html { render :show }
    #    format.json { render json: @article, status: :created, location: @article } 
    #  else
    #    format.html { render :index }
    #    format.json { render json: @article.errors, status: :unprcoessable_entity }
    #  end
    #end
  end

  def edit
  end

  def update
    #respond_to do |format|
    #  if @article.update(article_params)
    #    format.html { render :index }
    #    format.json { render json: @article, status: :ok, location: @article }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @article.errors, status: :unprcoessable_entity }
    #  end
    #end
  end

  def destroy
    #@article.destroy
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    #def article_params
    #  params.require(:article).permit(:article, :title, :body, :status)
    #end
end
