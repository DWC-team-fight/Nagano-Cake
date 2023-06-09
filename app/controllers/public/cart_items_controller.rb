class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    #カート内に同じ商品がある場合
    if current_customer.cart_items.find_by(product_id: params[:cart_item] [:product_id]).present?
      @cart_item = current_customer.cart_items.find_by(product_id: params[:cart_item] [:product_id])
      @cart_item.quantity += params[:cart_item] [:quantity].to_i
      @cart_item.save
      redirect_to cart_items_path
    #カート内に同じ商品がない場合
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items_path
    #保存できなかった場合
    else
    redirect_to request.referer
    end
  end
  
  #個数変更
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
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