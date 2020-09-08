require 'rails_helper'

RSpec.describe PurchaseShippingaddress, type: :model do
  describe '販売情報の保存' do
    before do
      @psa = FactoryBot.build(:purchase_shippingaddress)
    end
    context '販売情報登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@psa).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it '郵便番号が空だと保存できないこと' do
        @psa.postal_code = ''
        @psa.valid?
        expect(@psa.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @psa.postal_code = '1234567'
        @psa.valid?
        expect(@psa.errors.full_messages).to include('Postal code 郵便番号は123-4567という形で入力してください')
      end
      it '都道府県が非選択だと保存できないこと' do
        @psa.prefecture_id = 0
        @psa.valid?
        expect(@psa.errors.full_messages).to include('Prefecture 選択してください')
      end
      it '市町村が空だと保存できないこと' do
        @psa.city = ''
        @psa.valid?
        expect(@psa.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @psa.address = ''
        @psa.valid?
        expect(@psa.errors.full_messages).to include("Adress can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @psa.phone_number = ''
        @psa.valid?
        expect(@psa.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが入っていると登録できない' do
        @psa.password = '070-0000-0000'
        @psa.valid?
        expect(@psa.errors.full_messages).to include('Phone number 電話番号はハイフンなしで11桁以内で入力してください')
      end
      it '電話番号が11桁以上だと登録できない' do
        @psa.password = '123456789012'
        @psa.valid?
        expect(@psa.errors.full_messages).to include('Phone number 電話番号はハイフンなしで11桁以内で入力してください')
      end
    end
  end
end
