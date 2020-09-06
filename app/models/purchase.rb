class Purchase < ApplicationRecord

  has_many :users
  belongs_to :item
  has_one :shippingaddress

end

