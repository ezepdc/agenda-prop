class Property < ApplicationRecord
  belongs_to :contact
  belongs_to :user
end
