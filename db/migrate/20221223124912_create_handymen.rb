class CreateHandymen < ActiveRecord::Migration[7.0]
  def change
    create_table :handymen do |t|
      t.string :username
      t.string :password_digest
      t.string :location
      t.string :image
      t.string :description
      t.integer :admin_id
      t.string :rating

      t.timestamps
    end
  end
end
