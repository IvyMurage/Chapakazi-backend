class MessageSerializer < ActiveModel::Serializer
  attributes :id, :handyman_id, :customer_id, :message
end
