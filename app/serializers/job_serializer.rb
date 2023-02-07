class JobSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :budget, :description
  belongs_to :customer
  has_many :handymen
  has_many :job_handymen

  def summary
    "#{self.object.description[0..200]}..."
  end
end
