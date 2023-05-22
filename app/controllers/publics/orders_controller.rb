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
      @order.delivery_postal_code = params[:order][:delivery_postal_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
    end
    @cart_items = CartItem.all
  end
  
  #注文確定処理
  def create
    order = Order.new(order_params)
    order.status = 0
    order.save
    cart_items = CartItem.all
    cart_items.each do |cart_item|
      order_detail = OrderDetail.new(
        order_id:           order.id,
        product_id:         cart_item.product.id,
        once_price:         cart_item.product.once_price,
        quantity:           cart_item.quantity,
        product_order_status: 0 )
      order_detail.save
      cart_item.destroy
    end
  redirect_to orders_complete_path
  end

  def index
    @orders = Order.all.page(params[:page]).per(10)
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
