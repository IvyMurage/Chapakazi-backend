class RemoveHandymanIdFromJobHandymen < ActiveRecord::Migration[7.0]
  def change
    remove_column :job_handymen, :handyman_id, :string
  end
end
