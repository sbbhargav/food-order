class LineItem < ApplicationRecord
  belongs_to :food_item
  belongs_to :cart
end
