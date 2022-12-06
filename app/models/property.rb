class Property < ApplicationRecord
  belongs_to :contact, foreign_key: 'owner_id'
  belongs_to :user
  validates :property_reference, presence: true
  has_many :contracts, dependent: :destroy
end
