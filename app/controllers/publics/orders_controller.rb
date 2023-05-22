class Publics::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @delivery_address = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.delivery_postal_code = @delivery_address.postal_code
      @order.delivery_address = @delivery_address.address
      @order.delivery_name = @delivery_address.recive_name
    elsif params[:order][:select_address] == "2"
      @order.delivery_postal_code = params[:order][:postal_code]
      @order.delivery_address = params[:order][:address]
      @order.delivery_name = params[:order][:delivery_name]
      @order.customer_id = current_customer.id
    end
    @cart_items = CartItem.all
  end

  def index
    @orders = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end


  private
  
  def order_params
    params.require(:order).permit(:customer_id, :shipping_fee, :total_amount, :payment_method, 
    :delivery_postal_code, :delivery_address, :delivery_name, :status)
  end
  
end
