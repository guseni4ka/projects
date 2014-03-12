class Admin::CategoriesController < Admin::ApplicationController
  def index
    @categories = Category.order('published_at DESC')
    @categories = @categories.paginate(:page => params[:page], :per_page => 3)
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :published_at, {:category_ids => []})
  end
end