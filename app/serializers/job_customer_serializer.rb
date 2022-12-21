class JobCustomerSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :budget
  belongs_to :customer
end
