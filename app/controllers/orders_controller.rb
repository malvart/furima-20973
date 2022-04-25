class OrdersController < ApplicationController

  def index
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name,
                                        :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
end
