class Contract < ApplicationRecord
  belongs_to :property
  belongs_to :contact
  belongs_to :user
  validates :kind, presence: true
end
