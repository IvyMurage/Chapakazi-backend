class HandymanSerializer < ActiveModel::Serializer
  attributes :id, :username, :location, :image, :description, :rating, :speciality
end
