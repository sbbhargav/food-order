class ChangeQuanFromOrders < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :quantity, :integer
  end

  def down
    change_column :orders, :quantity, :string
  end
end
