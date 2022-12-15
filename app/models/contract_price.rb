class ContractPrice < ApplicationRecord
  belongs_to :contract
  belongs_to :user
  validates :price, numericality: true, allow_blank: true
end
