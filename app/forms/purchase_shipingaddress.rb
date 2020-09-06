class PurchaseShipingAddress

  include ActiveModel::Model
  attr_accessor :user, :item, :purchase, :postal_code, :prefecture,
                :city, :address, :building, :phone_number


  options_with presence :true do
    validates :prefecture, :city, :address,
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号は123-4567という形で入力してください' }
    validates :phone_number, format: { with: /\A\d{,11}\z/,
                                       message: '電話番号はハイフン不要で11桁以内で入力してください'}
  end


end