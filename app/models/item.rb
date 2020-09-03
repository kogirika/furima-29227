class Item < ApplicationRecord
  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :ship_preparation_day
  # Activeimageのアソシエーション
  has_one_attached :image
  # アソシエーション
  belongs_to :user
  # バリデーション
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id, numericality: { other_than: 0, message: '選択してください' }
    validates :status_id, numericality: { other_than: 0, message: '選択してください' }
    validates :ship_charge_id, numericality: { other_than: 0, message: '選択してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: '選択してください' }
    validates :ship_preparation_day_id, numericality: { other_than: 0, message: '選択してください' }
    validates :price, format: { with: /\A\d+\z/, message: '価格は半角数字で入力してください' }
    validates :price, numericality: { only_integer: true,
                                      greater_than_or_equal_to: 300,
                                      less_than_or_equal_to: 9_999_999,
                                      message: '価格は300~9,999,999の間で半角数字で入力してください' }
  end
end
