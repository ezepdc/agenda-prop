class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :registerable
  # :registerable
  has_many :contacts, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :contracts, dependent: :destroy
  has_many :contract_prices, dependent: :destroy
  has_many :incidents, dependent: :destroy
  has_many :incident_updates, dependent: :destroy
  has_many :settlements, dependent: :destroy
  has_many :bills, dependent: :destroy
  validates :phone, numericality: true, allow_blank: true
  validates :first_name, presence: true
  validates :agency_name, presence: true
end
