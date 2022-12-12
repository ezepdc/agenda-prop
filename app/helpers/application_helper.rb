module ApplicationHelper

  def is_active(status)
    params[:controller] == status
  end
end
