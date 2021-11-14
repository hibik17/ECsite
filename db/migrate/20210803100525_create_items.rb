class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :explanation
      t.string :integer
      t.integer :price
      t.boolean :is_sold, default: true, null: false
      t.timestamps
    end
  end
end
