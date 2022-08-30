class OrdersController < ApplicationController
  before_action :authenticated
  before_action :set_food_store, except: [:index, :create]
  before_action :set_food_item, except: [:index, :create]

  def index
    @orders = current_user.orders.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to food_stores_path
    else
      render food_stores_food_items(@food_store)
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :food_store_id, :food_item_id, :user_id)
  end

  def set_food_store
    @food_store = FoodStore.find(params[:food_store_id])
  end

  def set_food_item
    @food_item = FoodItem.find(params[:food_item_id])
  end
end
