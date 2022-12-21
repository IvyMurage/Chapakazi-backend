class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :location, :description, :admin_id
end
