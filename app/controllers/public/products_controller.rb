class Public::ProductsController < ApplicationController

  def index
    @total_products = Product.all
    @products = Product.all.page(params[:page]).per(8)
  end

  def show
    @product = Product.find(params[:id])

    @cart_item = CartItem.new
  end

  private
  def products_params
    params.require(:product).permit(:genle_id, :name, :introduction, :price, :is_status, :image_id, :image)
  end
<<<<<<< HEAD
=======

>>>>>>> origin/develop
end
