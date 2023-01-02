class Review < ApplicationRecord
  validates :comment, presence: true
  belongs_to :customer
  belongs_to :handyman
end
