class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :location, :admin_id
  has_many :messages
end
