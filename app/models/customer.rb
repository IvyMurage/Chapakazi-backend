class Customer < ApplicationRecord
  has_many :jobs
  has_many :reviews
  has_secure_password
end
