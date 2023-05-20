class Publics::HomesController < ApplicationController

  def top
    @products = Product.all.order(created_at: :asc)
    #=> :asc,古い順 :desc,新しい順
    @genres = Genere.all
  end

  def about
  end
end

