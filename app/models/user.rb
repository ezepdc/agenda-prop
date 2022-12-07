class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contacts
  validates :phone, numericality: true, allow_blank: true
  validates :first_name, presence: true
  validates :agency_name, presence: true
  has_many :properties
  has_many :contracts
  has_many :contract_prices
  has_many :incidents
  has_many :incident_updates
  has_many :settlements
end
