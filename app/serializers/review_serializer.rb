class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :comment, :handyman_id, :customer_id
end
