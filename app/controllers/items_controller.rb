class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  def set_item 
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :status_id, :ship_charge_id, :prefecture_id,
                                 :ship_preparation_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
