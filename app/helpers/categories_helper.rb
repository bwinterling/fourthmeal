module CategoriesHelper
  def current_category
    @current_category ||= Category.all
  end

  def show_all_categories
    @show_all_categories ||= true
  end

end