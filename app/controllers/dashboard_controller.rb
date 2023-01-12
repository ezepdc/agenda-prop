class DashboardController < ApplicationController

  def index
    @properties = Property.order(updated_at: :desc).limit(3)
    @incidents = Incident.order(updated_at: :desc).limit(3)
    @contacts = Contact.order(updated_at: :desc).limit(3)
    @bills = Bill.order(updated_at: :desc).limit(3)
    @settlements = Settlement.order(updated_at: :desc).limit(3)
  end
end
