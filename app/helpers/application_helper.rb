module ApplicationHelper

  def current_page
    (params[:page] || 1).to_i
  end

  def pages
    ((current_page - 3)..(current_page+ 3))
  end

  def total_pages
    (@total_count / 20.to_f).ceil
  end

end
