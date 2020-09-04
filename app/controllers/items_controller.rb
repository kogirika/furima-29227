class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end


  private

  def items_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :ship_charge_id, :prefecture_id,
                                 :ship_preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
