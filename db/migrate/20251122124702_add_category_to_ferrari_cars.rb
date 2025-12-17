class AddCategoryToFerrariCars < ActiveRecord::Migration[7.2]
  def change
    add_reference :ferrari_cars, :category, null: false, foreign_key: true

  end
end
