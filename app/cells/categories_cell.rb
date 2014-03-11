class CategoriesCell < Cell::Rails
  def sidebar
    @categories = Category.order('title DESC')
    render
  end
end