class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  #注文情報入力画面(支払方法・配送先の選択)
  def new
    cart_items = current_customer.cart_items
    if cart_items.present?
      @order = Order.new
      @delivery_addresses = DeliveryAddress.all
    else
      redirect_to request.referer
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.shopping_fee = 800
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
    @cart_items = current_customer.cart_items
    
  end

  #注文確定処理
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    if order.save
      cart_items = CartItem.all
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new(
          order_id:           order.id,
          product_id:         cart_item.product.id,
          quantity:           cart_item.quantity,
          once_price:        (cart_item.product.tax_excluded_price*1.08).floor,
          product_order_status: 0 )
        order_detail.save
        cart_item.destroy
      end
      redirect_to orders_complete_path
    else
      redirect_to root_path
    end
    
  end

  def index
    @orders=current_customer.orders.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :shopping_fee, :total_amount, :payment_method,
    :delivery_postal_code, :delivery_address, :delivery_name, :status)
  end


end