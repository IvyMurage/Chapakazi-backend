class Job < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    belongs_to :customer
end

