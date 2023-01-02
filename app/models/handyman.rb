class Handyman < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 8 }
  validates :password_confirmation, presence: true, length: { maximum: 8 }
  validates :image, presence: true
  validates :location, presence: true
  has_many :reviews, dependent: :destroy
end