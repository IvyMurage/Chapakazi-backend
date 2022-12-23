class HandymanSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :location, :image, :description, :admin_id, :rating
end
