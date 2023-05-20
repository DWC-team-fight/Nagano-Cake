class Publics::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end


  private
  
  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :total_amount, :payment_method, 
    :delivery_post_code, :delivery_address, :delivery_name, :status)
  end
  
end
