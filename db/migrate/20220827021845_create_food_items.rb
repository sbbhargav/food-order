class CreateFoodItems < ActiveRecord::Migration[7.0]
  def change
    create_table :food_items do |t|
      t.string :item_name
      t.string :item_price
      t.references :food_store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
