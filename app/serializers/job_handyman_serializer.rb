class JobHandymanSerializer < ActiveModel::Serializer
  attributes :id, :status, :handyman_id, :job_id
end
