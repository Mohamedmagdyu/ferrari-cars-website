class CreateFerrariCars < ActiveRecord::Migration[7.2]
  def change
    create_table :ferrari_cars do |t|
      t.string :name
      t.string :model
      t.integer :year
      t.decimal :price
      t.text :description
      t.string :engine
      t.integer :top_speed
      t.decimal :acceleration
      t.string :status, default: "available"
      t.string :slug

      t.index :slug, unique: true

      t.timestamps
    end
  end
end
