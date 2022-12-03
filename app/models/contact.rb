class Contact < ApplicationRecord
  belongs_to :user
  validates :kind, inclusion: { in: %w(Garante Inquilino Propietario Proveedor) }
  validates_presence_of :first_name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, numericality: true, allow_blank: true
  has_many :properties
  has_many :contracts
end
