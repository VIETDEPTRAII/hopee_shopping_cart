module ApplicationHelper

  def full_title(page_title = '')
    base_title = 'Hopee Shopping Cart'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
