class Incident < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :contact
  has_many :incident_updates, dependent: :destroy
  has_many_attached :documents
  validates :kind, presence: true
  validates :description, presence: true
end
