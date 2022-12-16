class IncidentUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_many_attached :documents, dependent: :destroy
  validates :notes, presence: true
  enum status: [:pending, :doing, :rejected, :done]
end
