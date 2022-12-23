class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :handyman_id
      t.integer :customer_id
      t.string :message

      t.timestamps
    end
  end
end
