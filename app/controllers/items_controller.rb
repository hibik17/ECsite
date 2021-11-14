class ItemsController < ApplicationController
  def index
    @genres=Genre.all
    if params[:genre_id]
      @genre=Genre.find(params[:genre_id])
      @items=@genre.items.where(is_sold: true)
    else
      @items=Item.where(is_sold: true)
    end
  end

  def show
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
  end
end
