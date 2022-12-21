class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username
      t.string :image
      t.string :password_digest
      t.string :location
      t.string :description
      t.integer :admin_id

      t.timestamps
    end
  end
end
