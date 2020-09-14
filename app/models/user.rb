class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # アソシエーション
  has_many :items
  has_many :purchases

  # バリデーション
  with_options presence: true do
    validates :nickname
    validates :email,          format: { with: /\A.+@.+\z/, message: 'を入力してください' }
    validates :password,       format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6,}\z/i, message: '英数字混合６文字以上で入力してください' }
    validates :firstname,      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :lastname,       format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を全角で入力してください' }
    validates :firstname_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カナで入力してください' }
    validates :lastname_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'を全角カナで入力してください' }
    validates :birthday
  end
end
