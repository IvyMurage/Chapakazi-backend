class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :username, :image, :password_digest, :location, :description, :admin_id
end
