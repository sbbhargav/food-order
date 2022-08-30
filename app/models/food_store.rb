class FoodStore < ApplicationRecord
  has_many :food_items
  has_many :orders
  has_many :carts
end
