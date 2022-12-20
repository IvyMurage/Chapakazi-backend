class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :budget, :customer_id
end
