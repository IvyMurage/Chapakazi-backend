class Review < ApplicationRecord
  validates :comment, presence: true, length: { in: 155...260 }
  belongs_to :customer
  belongs_to :handyman
end
