class Property < ApplicationRecord
  belongs_to :user
  belongs_to :owner, foreign_key: 'owner_id', class_name: "Contact"
  has_many :contracts, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :settlements, dependent: :destroy
  has_many :bills, dependent: :destroy
  has_many_attached :photos, dependent: :destroy
  validates :reference, presence: true
  validates :total_area, numericality: true, allow_blank: true
  validates :covered_area, numericality: true, allow_blank: true
  monetize :price_cents, allow_nil: true
  accepts_nested_attributes_for :owner, reject_if: :all_blank
end
