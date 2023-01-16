class AdminSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
  has_many :customers
  has_many :handymen
end
