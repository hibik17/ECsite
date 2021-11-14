class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :zip_code
      t.string :address
      t.string :name
      
      t.timestamps
    end
  end
end
