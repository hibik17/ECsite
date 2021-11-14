class OrdersController < ApplicationController
  before_action :is_cart_empty?, only:[:new, :create, :confirm]

  def new
    @order = Order.new
    @addresses = current_end_user.addresses
  end

  def create
    # orderのsave
    order=Order.new(order_params)
    order.end_user_id=current_end_user.id
    byebug
    if order.save
      current_end_user.cart_items.each do |cart_item|
        order_detail=OrderDetail.new
        order_detail.order_id=order.id
        order_detail.item_id=cart_item.item_id
        order_detail.price=cart_item.item.price
        order_detail.amount=cart_item.amount
        order_detail.save
      end
      current_end_user.cart_items.destroy_all
      redirect_to complete_order_path
    end
  end

  def index
  end

  def show
  end

  def confirm
    shipping_destination=params[:order][:destination]
    @order=Order.new(order_params)
    @order.end_user_id=current_end_user.id
    @order.shipping_fee=800
    puts shipping_destination
    puts current_end_user

    case shipping_destination.to_i
    when 0
      @order.address=current_end_user.address
      @order.zip_code=current_end_user.zip_code
      @order.address_name=current_end_user.family_name+current_end_user.first_name
    when 1
      address=Address.find(params[:order][:address_id])
      @order.address=address.address
      @order.zip_code=address.zip_code
      @order.address_name=address.name
    when 2
    end

    @cart_items = current_end_user.cart_items
    @total=0
    @cart_items.each do |cart_item|
      @total+=cart_item.item.price*cart_item.amount
    end
    @order.total_price=@order.shipping_fee+@total

  end

  def complete
  end


  def is_cart_empty?
    if !current_end_user.cart_items.any? or current_end_user.cart_items.where(amount:0).count >= 1
      flash[:error]="カート内の商品がないまたは不適切です"
      redirect_to cart_items_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :zip_code, :address_name, :shipping_fee, :total_price)
  end

end
