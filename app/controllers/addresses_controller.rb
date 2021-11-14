class AddressesController < ApplicationController
  def index
    @addresses = current_end_user.addresses
    @address = Address.new
  end

  def edit
  end

  def create
    @address= Address.new(address_params)
    @address.end_user_id = current_end_user.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses=current_end_user.addresses
      render :index
    end
  end

  def update
  end

  def destroy
    address=Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:zip_code,:address,:name)
  end
end
