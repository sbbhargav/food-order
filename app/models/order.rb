class Order < ApplicationRecord
  belongs_to :food_store
  belongs_to :food_item
  belongs_to :user
end
