class CreateJobHandymen < ActiveRecord::Migration[7.0]
  def change
    create_table :job_handymen do |t|
      t.integer :job_id
      t.string :handyman_id

      t.timestamps
    end
  end
end
