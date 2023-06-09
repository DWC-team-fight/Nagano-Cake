class Public::DeliveryAddressesController < ApplicationController
   before_action :authenticate_customer!

  def index
    @customer = current_customer
    @delivery_addresses = @customer.delivery_addresses.all
    @delivery_address = DeliveryAddress.new
  end

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer = current_customer
    if @delivery_address.save
      redirect_to request.referer
    else
      render :index
    end
  end

  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.update(delivery_address_params)
      redirect_to delivery_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to delivery_addresses_path
  end

  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code,:address,:recive_name)
  end

end
