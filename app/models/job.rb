class Job < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100 }
  belongs_to :customer
end
