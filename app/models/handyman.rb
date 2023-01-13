class Handyman < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { maximum: 8 }
  validates :password_confirmation, presence: true, length: { maximum: 8 }
  validates :description, length: { in: 155..260 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :image, presence: true
  validates :location, presence: true
  has_many :reviews, dependent: :destroy

  # has_one_attached :image
end
