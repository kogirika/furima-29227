class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
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

  private
  
  def items_params
    params.require(:item).permit(:name, :info, :category, :status, :ship_charge, :ship_from,
                                  :ship_preparation_day, :price, :image).merge(user_id: current_user.id)
  end

end
