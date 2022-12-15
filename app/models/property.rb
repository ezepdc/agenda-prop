class Property < ApplicationRecord
  belongs_to :user
  belongs_to :owner, foreign_key: 'owner_id', class_name: "Contact"
  has_many :contracts, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :settlements, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  validates :property_reference, presence: true
  validates :total_area, numericality: true, allow_blank: true
  validates :covered_area, numericality: true, allow_blank: true
  validates :price, numericality: true, allow_blank: true
end
