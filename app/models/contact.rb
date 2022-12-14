class Contact < ApplicationRecord
  belongs_to :user
  has_many :properties, foreign_key: 'owner_id', dependent: :destroy
  has_many :contracts, foreign_key: 'tenant_id', dependent: :destroy
  has_many :contracts, foreign_key: 'guarantor_id', dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates_presence_of :first_name
  validates :kind, inclusion: { in: %w(Garante Inquilino Propietario Proveedor) }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone, numericality: true, allow_blank: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
