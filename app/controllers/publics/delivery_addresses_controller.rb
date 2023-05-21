class Publics::DeliveryAddressesController < ApplicationController
  
  def index
    @delivery_addresses = DeliveryAddress.all
    @delivery_address = DeliveryAddress.new
  end
  
  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.customer_id = 1
    if @delivery_address.save
      redirect_to request.referer
    else
      @delivery_addresses = DeliveryAddress.all
      render :index
    end
  end
  
  def edit
    @delivery_address = DeliveryAddress.find(params[:id])
  end

  def update
    @delivery_address = DeliveryAddress.find(params[:id])
    if @delivery_address.update(delivery_address_params)
      redirect_to '/delivery_addresses'
    else
      render :edit
    end
  end

  def destroy
    @delivery_address = DeliveryAddress.find(params[:id])
    @delivery_address.destroy
    redirect_to '/delivery_addresses'
  end
  
  private
  def delivery_address_params
    params.require(:delivery_address).permit(:postal_code,:address,:recive_name)
  end
  
end
