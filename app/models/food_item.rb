class FoodItem < ApplicationRecord
  belongs_to :food_store
  has_many :orders
  has_many :line_items
end
