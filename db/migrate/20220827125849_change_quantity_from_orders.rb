class ChangeQuantityFromOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :quantity, :integer
  end
end
