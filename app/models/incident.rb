class Incident < ApplicationRecord
  belongs_to :property
  belongs_to :contact
  belongs_to :user
end
