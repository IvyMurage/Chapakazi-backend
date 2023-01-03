class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :handyman_id, :created_at
  belongs_to :customer
end
