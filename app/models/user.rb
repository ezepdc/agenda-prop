class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable
  # :registerable
  has_many :contacts
  has_many :properties
  has_many :contracts
  has_many :contract_prices
  has_many :incidents
  has_many :incident_updates
  has_many :settlements
  has_many :bills
  validates :phone, numericality: true, allow_blank: true
  validates :first_name, presence: true
  validates :agency_name, presence: true
end
