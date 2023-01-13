class Customer < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { maximum: 8 }
  validates :password_confirmation, presence: true, length: { maximum: 8 }
  validates :location, presence: true
  has_many :jobs, dependent: :destroy
  has_many :reviews
end
