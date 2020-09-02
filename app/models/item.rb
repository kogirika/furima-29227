class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence :true do
    validates :name
    validates :info
    validates :category
    validates :status
    validates :ship_charge
    validates :ship_from
    validates :ship_preparation_day
    validates :price, numericality: { only_integer: true,
                                      greater_than: 300, less_than: 9999999,
                                      message: '価格は¥300~¥9,999,999の間で入力してください' },
                      format: { with: /\A[0-9]+\z/,message: '価格は半角数字で入力してください' }
  end


end
