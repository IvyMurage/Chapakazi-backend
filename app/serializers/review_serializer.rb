class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :handyman_id, :created_at, :votes
  belongs_to :customer
end
