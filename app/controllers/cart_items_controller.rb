class CartItemsController < ApplicationController
  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.end_user_id = current_end_user.id
    #すでに存在する→amountに加算するだけ　新規投稿→table作成
    if cart_item.amount>0
      if item_already_registered?(cart_item.item_id)
        add_cart_item = CartItem.find_by(end_user_id: current_end_user, item_id: cart_item.item_id)
        add_cart_item.amount += cart_item.amount
        add_cart_item.update(amount: add_cart_item.amount)
        redirect_to cart_items_path
      else
        cart_item.save
        redirect_to cart_items_path
      end
    else
      flash[:error]="適切な数量を入力してください"
      redirect_to item_path(params[:cart_item][:item_id].to_i)
    end
  end

  def index
    @cart_items=current_end_user.cart_items.all
    @total=0
    @cart_items.each do |cart_item|
      @total+=cart_item.item.price*cart_item.amount
    end
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path, notice: "カート商品を削除しました"
  end

  def destroy_all
    cart_items=current_end_user.cart_items.all
    cart_items.destroy_all
    redirect_to cart_items_path, notice: "カート内商品を全て削除しました"
  end

  def update
    cart_item = CartItem.find(params[:id])
    # byebug
    if params[:cart_item][:amount].to_i >0
      cart_item.update(cart_item_params)
      redirect_to cart_items_path, notice: "商品数量を変更しました"
    else
      @cart_items=current_end_user.cart_items.all
      @total=0
      @cart_items.each do |cart_item|
        @total+=cart_item.item.price*cart_item.amount
      end
      flash[:error]="適切な数量を入力してください"
      render :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id)
  end

  # 現在のユーザーと該当アイテムのものがすでにcart_item内に存在するかを判定する
  def item_already_registered?(each_item_id)
    CartItem.where(end_user_id: current_end_user.id, item_id: each_item_id).exists?
  end

end
