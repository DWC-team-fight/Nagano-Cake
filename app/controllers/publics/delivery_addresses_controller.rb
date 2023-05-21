class Publics::DeliveryAddressesController < ApplicationController
  
  def index
    @delivery_address = DeliveryAddress.new
    @delivery_addresses = DeliveryAddress.all
  end
  
  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.save
    redirect_to delivery_addresses_path
  end
  
  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end
  
  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code,:address,:recive_name)
  end
  
end
