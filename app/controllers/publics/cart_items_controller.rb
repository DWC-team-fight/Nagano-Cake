class Publics::CartItemsController < ApplicationController

  def index
    @cart_item = CartItem.all
  end

  def create
    @cart_item = CartItem.find_by(product_id: cart_item_params[:product_id])
    @cart_item.save
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:customer_id, :product_id, :quantity)
  end

end
