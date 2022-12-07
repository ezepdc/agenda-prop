class Bill < ApplicationRecord
  belongs_to :property
  belongs_to :contact
  belongs_to :settlement
end
