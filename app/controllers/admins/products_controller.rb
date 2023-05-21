class Admins::ProductsController < ApplicationController
  def new
    @product = Product.new
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :tax_excluded_price, :is_status, :image)
  end
end
