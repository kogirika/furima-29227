class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_shippingaddress = PurchaseShippingaddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shippingaddress = PurchaseShippingaddress.new(purchase_params)
    if @purchase_shippingaddress.valid?
      pay_item
      @purchase_shippingaddress.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_shippingaddress).permit(:token, :postal_code, :prefecture_id, :city, :address, :building,
                                                     :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
  
end
