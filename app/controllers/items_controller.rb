class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :find_item, only: [:show, :edit, :update]
  before_action :varify_user, only: :edit

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :charge_id, :prefecture_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def varify_user
    redirect_to root_path unless current_user == @item.user
  end
end
