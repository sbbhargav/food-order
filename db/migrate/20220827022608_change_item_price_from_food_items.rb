class ChangeItemPriceFromFoodItems < ActiveRecord::Migration[7.0]
  def up
    change_column :food_items, :item_price, :integer
  end

  def down
    change_column :food_items, :item_price, :string
  end
end
