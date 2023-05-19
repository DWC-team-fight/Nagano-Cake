class Publics::ItemsController < ApplicationController
  
  
  def show
    @item = Item.find(parems[:id])
    @care_item = CartItem.new
    if customer_signed_in? 
      @customer_item = CartItenm.where(customer_id:[current_customer.id])
    end
  end
  
  def index
    
