class Admin::ItemsController < ApplicationController

  def index
    @items=Item.all
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      flash[:notice] = "商品の登録に成功しました"
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def show
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end

  def update
    @item=Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
      flash[:notice]="商品情報を更新しました"
    else
      render :edit
    end
  end
  
  def search
    @items=Item.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end 
  
  private

  def item_params
    params.require(:item).permit(:name,:genre_id,:explanation,:image,:price,:is_sold)
  end

end
