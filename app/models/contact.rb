class Contact < ApplicationRecord
  belongs_to :user
  validates :kind, inclusion: { in: %w(Garante Inquilino Propietario Proveedor) }
  validates_presence_of :first_name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, numericality: true, allow_blank: true
  has_many :properties, foreign_key: 'owner_id'
  has_many :contracts, foreign_key: 'tenant_id'
  has_many :contracts, foreign_key: 'guarantor_id'
  has_many :incidents

  def full_name
    "#{first_name} #{last_name}"
  end
end
