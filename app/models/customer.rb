class Customer < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { maximum: 8 }, if: :password_required?
  validates :password_confirmation, presence: true, length: { maximum: 8 }, if: :password_required?
  validates :location, presence: true
  has_many :jobs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  belongs_to :admin

  private

  def password_required?
    password.present?
  end
end
