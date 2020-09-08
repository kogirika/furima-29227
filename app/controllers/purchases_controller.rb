class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_top, only: [:index, :create] # 購入済み、出品者をトップに飛ばす

  def index
    @purchase_shippingaddress = PurchaseShippingaddress.new
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_top
    redirect_to root_path if current_user.id == Item.find(params[:item_id]).user_id
    redirect_to root_path unless Item.find(params[:item_id]).purchase.nil?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
