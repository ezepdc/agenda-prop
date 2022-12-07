class Settlement < ApplicationRecord
  belongs_to :property
  belongs_to :user
  validates :amount, presence: true
end
