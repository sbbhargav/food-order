class CreateFoodStores < ActiveRecord::Migration[7.0]
  def change
    create_table :food_stores do |t|
      t.string :name

      t.timestamps
    end
  end
end
