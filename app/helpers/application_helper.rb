module ApplicationHelper
  include Pagy::Frontend
  
  def class_for_nav(status, actual = params[:controller])
    if actual == status
      "active"
    else
      "nav-link-gray"
    end
  end
end
