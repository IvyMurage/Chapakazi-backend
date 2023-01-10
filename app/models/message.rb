class Message < ApplicationRecord
  validates :message, presence: true
  belongs_to :customer
  belongs_to :handyman
end
