class Contact < ApplicationRecord
  belongs_to :user
  validates :kind, inclusion: { in: %w(Garante Inquilino Propietario Proveedor) }
  validates_presence_of :first_name, :last_name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, numericality: true
end
