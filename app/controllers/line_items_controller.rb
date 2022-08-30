class LineItemsController < ApplicationController
  before_action :authenticated
  before_action :set_cart, except: [:index, :create]
  before_action :set_food_item, except: [:index, :create]

  def index
    @line_items = current_user.line_items.all
  end

  def new
    @line_item = LineItem.new
  end

  def create
    unless current_cart
      @food_item = FoodItem.find(params[:line_item][:food_item_id])
      cart = Cart.create(user_id: current_user.id, food_store_id: @food_item.food_store.id)
      session[:cart_id] = cart.id
    end

    @line_item = LineItem.new(line_item_params)

    if @line_item.save
      redirect_to food_stores_path
    else
      render food_stores_food_items(@food_store)
    end
  end

  def destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :food_item_id, :cart_id)
  end

  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  def set_food_item
    @food_item = FoodItem.find(params[:food_item_id])
  end
end