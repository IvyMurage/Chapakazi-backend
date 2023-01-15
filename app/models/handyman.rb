class Handyman < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..8 }, if: :password_required?
  validates :password_confirmation, length: { in: 6..8 }, if: :password_required?
  validates :description, length: { in: 155..1000 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :image, presence: true
  validates :location, presence: true
  has_many :reviews, dependent: :destroy
  has_many :messages

  private

  def password_required?
    false || password.present?
  end
end
