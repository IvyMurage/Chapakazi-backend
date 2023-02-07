class Job < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 100 }
  belongs_to :customer
  has_many :job_handymen, dependent: :destroy
  has_many :handymen, through: :job_handymen, dependent: :destroy
end
