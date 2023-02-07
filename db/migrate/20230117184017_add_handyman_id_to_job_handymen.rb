class AddHandymanIdToJobHandymen < ActiveRecord::Migration[7.0]
  def change
    add_column :job_handymen, :handyman_id, :integer
  end
end
