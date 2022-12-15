class IncidentUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_many_attached :documents, dependent: :destroy
  validates :status, inclusion: { in: ['Pendiente', 'En curso', 'Rechazada', 'Finalizada'] }
  validates :notes, presence: true
end
