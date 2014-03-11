class Admin::ArticlesController < Admin::ApplicationController
  def index
    @articles = Article.order('published_at DESC').active
    @articles = @articles.paginate(:page => params[:page], :per_page => 3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to admin_article_path(@article)
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
      redirect_to admin_articles_path
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :published_at, {:category_ids => []})
    end
end