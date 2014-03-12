class ArticlesController < ApplicationController
  def index
    if (params[:slug])
      @articles = Article.list(params[:slug])
    else
      @articles = Article.order('published_at DESC').active
    end        
    @articles = @articles.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @article = Article.find(params[:id])
    not_found unless @article.active?
  end
end