class HandymanSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id, :username, :location, :image, :description, :rating, :speciality

  # def image
  #   Rails.application.routes.url_helpers.url_for(image) if image.attached?
  # end
end
