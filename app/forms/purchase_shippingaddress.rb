class PurchaseShippingaddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :purchase_id,
                :postal_code, :prefecture_id, :city, :address, :building, :phone_number
  # バリデーション
  with_options presence: true do
    validates :token
    validates :postal_code,  format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は123-4567という形で入力してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/, message: 'はハイフンなしで11桁以内で入力してください' }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shippingaddress.create(purchase_id: purchase.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city,
                           address: address, building: building, phone_number: phone_number)
  end
end
