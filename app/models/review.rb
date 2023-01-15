class Review < ApplicationRecord
  validates :comment, presence: true, length: { in: 155...1000 }
  belongs_to :customer
  belongs_to :handyman

end
