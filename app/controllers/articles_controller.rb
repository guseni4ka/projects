class ArticlesController < ApplicationController
  def index
    @articles = Article.order('published_at DESC').active
    @articles = @articles.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @article = Article.find(params[:id])
    not_found unless @article.active?
  end
end