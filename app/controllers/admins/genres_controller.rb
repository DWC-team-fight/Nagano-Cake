class Admins::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admins_genres_path(@genre), notice: "商品を登録しました。"
    else
      render :index
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
