class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :handyman_id, :votes
  belongs_to :customer
end
