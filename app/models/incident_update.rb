class IncidentUpdate < ApplicationRecord
  belongs_to :incident
  belongs_to :user
  validates :incident_status, inclusion: { in: %w(Pendiente En curso Rechazada Finalizada) }
end
