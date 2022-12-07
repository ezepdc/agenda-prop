class IncidentUpdate < ApplicationRecord
  belongs_to :incident
  belongs_to :user
  validates :incident_status, inclusion: { in: ['Pendiente', 'En curso', 'Rechazada', 'Finalizada'] }
  validates :notes, presence: true
end
