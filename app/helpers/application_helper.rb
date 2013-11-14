module ApplicationHelper
  
  def page_title
    if @page_title
      "- #{@page_title}"
    elsif content_for?(:title)
      "- " + content_for(:title)
    end
  end

  def categories
    @categories ||= Category.all
  end
  
end
