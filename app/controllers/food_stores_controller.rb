class FoodStoresController < ApplicationController
  before_action :authenticated

  def index
    @food_stores = FoodStore.all
  end

  def new
    @food_store = FoodStore.new
  end

  def create
    @food_store = FoodStore.new(food_store_params)
    
    if @food_store.save
      redirect_to food_stores_path
    else
      render :new
    end
  end

  private

  def food_store_params
    params.require(:food_store).permit(:name)
  end
end
