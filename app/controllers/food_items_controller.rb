class FoodItemsController < ApplicationController
  before_action :authenticated
  before_action :set_food_store

  def index
    @food_items = @food_store.food_items
    @order = Order.new
  end

  def new
    @food_item = @food_store.food_items.build
  end

  def create
    @food_item = @food_store.food_items.build(food_item_params)
    
    if @food_item.save
      redirect_to food_store_food_items_path(@food_store)
    else
      render :new
    end
  end

  private

  def food_item_params
    params.require(:food_item).permit(:item_name, :item_price, :food_store_id)
  end

  def set_food_store
    @food_store = FoodStore.find(params[:food_store_id])
  end
end
