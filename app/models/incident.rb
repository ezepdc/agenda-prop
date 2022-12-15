class Incident < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :contact
  has_many :incident_updates, dependent: :destroy
  has_many_attached :documents, dependent: :destroy
  validates :kind, presence: true
  validates :description, presence: true

  def status
    incident_updates&.last&.incident_status || "Pendiente"
  end
end
