class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :type
      t.decimal :price
      t.string :currency
      t.references :community, null: false, foreign_key: true, index: true
      t.string :address
      t.float :area
      t.integer :number_of_rooms
      t.string :number_of_bathrooms
      t.text :description

      t.timestamps
    end
  end
end
