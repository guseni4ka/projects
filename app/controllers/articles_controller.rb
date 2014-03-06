class ArticlesController < ApplicationController
  def index
    @articles = Article.order('published_at DESC').active
    @articles = @articles.paginate(:page => params[:page], :per_page => 3)
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    not_found unless @article.active?
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'article'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    #puts @article.published_at.inspect
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :published_at, {:category_ids => []})
    end
end