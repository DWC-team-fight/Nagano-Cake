class Publics::CartItemsController < ApplicationController
  
  def index
    @cart_item = CartItem.all
  end

  def create
    @cart_item = CartItem.find(cart_item_params)
    @cart_item.save
  end

  private
  
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
  
end
