class Customer < ApplicationRecord
  has_secure_password
  has_many :jobs
  has_many :reviews
end
