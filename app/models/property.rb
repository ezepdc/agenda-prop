class Property < ApplicationRecord
  belongs_to :owner, foreign_key: 'owner_id', class_name: "Contact"
  belongs_to :user
  validates :property_reference, presence: true
  has_many :contracts, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :settlements, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_many_attached :photos
end
