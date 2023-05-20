class Publics::ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(paramas[:id])
    @cart_item = CartItem.new
    if customer_singned_in?
      @cart_items = CartItem.where(customer_id:[current_customer.id])
    end
end
