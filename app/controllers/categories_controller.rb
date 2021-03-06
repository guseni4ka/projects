class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = @categories.paginate(:page => params[:page], :per_page => 3)
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end  

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render 'new'
    end
  end

  private
    def category_params
      params.require(:category).permit(:title, :slug)
    end
end
