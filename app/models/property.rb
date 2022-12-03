class Property < ApplicationRecord
  belongs_to :contact
  belongs_to :user
  validates :property_reference, presence: true
end
