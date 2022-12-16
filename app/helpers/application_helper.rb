module ApplicationHelper

  def is_active(status)
    if params[:controller] == status
      'active'
    else
      'nav-link-gray'
    end
  end
end
