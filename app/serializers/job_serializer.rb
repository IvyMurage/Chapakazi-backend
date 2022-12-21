class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :budget

  def summary
    "#{self.object.description[1..50]}..."
  end
end
