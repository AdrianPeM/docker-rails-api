class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :destroy]
  
  def index
    render json: Article.all
  end

  def create
    article = Article.new(article_params)

    if article.save
      render json: { message: "Article successfully created.", article: article}
    else
      render json: { message: "Unable to create Article." }, status: :unprocessable_entity
    end
  end

  def show
    render json: @article
  end
  
  def update
    if @article
      @article.update(article_params)
      render json: { message: "Article successfully updated." }, status: 200
    else
      render json: { message: "Unable to update Article." }, status: :unprocessable_entity
    end
  end

  def destroy
    if @article
      @article.destroy
      render json: { message: "Article successfully deleted." }, status: 200
    else
      render json: { error: "Unable to delete Article." }, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def find_article
      @article = Article.find_by_id(params[:id])
    end
    
end
