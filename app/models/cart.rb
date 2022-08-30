class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :food_store
  has_many :line_items
end
