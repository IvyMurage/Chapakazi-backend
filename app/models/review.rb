class Review < ApplicationRecord
  validates :comment, presence: true, length: { in: 155...260 }
  # validate  :vote

  belongs_to :customer
  belongs_to :handyman

  # def vote
  #   if self.votes < 0
  #    votes =  0
  #   end
  # end
end
