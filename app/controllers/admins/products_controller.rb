class Admins::ProductsController < ApplicationController

  def index
    @products = Product.page(params[:page])
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admins_products_path(@product), notice: "商品を登録しました。"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admins_products_path(@product), notice: "商品を編集しました。"
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:genre_id, :name, :description, :tax_excluded_price, :is_status, :image)
  end
end
