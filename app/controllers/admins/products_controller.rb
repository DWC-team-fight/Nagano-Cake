class Admins::ProductsController < ApplicationController
  def new
    @product_new = Product.new
    @genres = Genre.all
  end
end
