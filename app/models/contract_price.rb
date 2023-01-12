class ContractPrice < ApplicationRecord
  belongs_to :contract
  belongs_to :user
  monetize :price_cents
end
