class HandymanSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id, :username, :location, :image, :description, :rating, :speciality
  has_many :job_handymen
  has_many :jobs
  has_many :messages
end
