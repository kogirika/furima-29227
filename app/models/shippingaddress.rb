class Shippingaddress < ApplicationRecord

  # ActiveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # アソシエーション
  belongs_to :purchase
end
