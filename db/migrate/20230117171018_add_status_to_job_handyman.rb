class AddStatusToJobHandyman < ActiveRecord::Migration[7.0]
  def change
    add_column :job_handymen, :status, :string
  end
end
