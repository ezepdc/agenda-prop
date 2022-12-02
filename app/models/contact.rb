class Contact < ApplicationRecord
  belongs_to :user
  validates :contact_type, inclusion: { in: %w(Garante Inquilino Propietario Proveedor) }
end
