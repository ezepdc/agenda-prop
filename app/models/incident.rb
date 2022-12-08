class Incident < ApplicationRecord
  belongs_to :property
  belongs_to :contact
  belongs_to :user
  validates :kind, presence: true
  validates :description, presence: true
  has_many :incident_updates, dependent: :destroy
  has_many_attached :documents
end
