class Admins::ProductsController < ApplicationController
  def new
    @product_new = Product.new
  end
end
