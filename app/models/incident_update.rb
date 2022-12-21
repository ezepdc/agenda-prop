class IncidentUpdate < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  has_many_attached :documents, dependent: :destroy
  validates :notes, presence: true
  include TranslateEnum
  enum status: { pending: 0, doing: 1, rejected: 2, done: 3 }
  translate_enum :status
end
