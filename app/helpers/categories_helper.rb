module CategoriesHelper
  def current_category
    @current_category ||= nil
  end

  def category_link(category, current=nil)
    css_class = "category" 
    if category == current
      css_class += "active"
    end

    link_to category.title, 
            menu_items_path(category.to_param), 
            class: css_class
  end

end