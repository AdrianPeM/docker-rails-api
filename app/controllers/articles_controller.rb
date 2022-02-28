class ArticlesController < ApplicationController
  def index
    render json: {articles: Article.all}
  end

  def show
    article = Article.find_by_id(params[:id])

    render json: {article: article.as_json}
  end

  def create
    article = Article.new(article_params)

    if article.save
      redirect_to "/articles/#{article.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    article = Article.find(params[:id])
    render json: {article: article}
  end

  def update
    article = Article.find(params[:id])

    if article.update(article_params)
      redirect_to "/articles/#{article.id}"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    redirect_to articles_url, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
