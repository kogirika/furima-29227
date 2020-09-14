require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'itemの保存' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/sample.png')
    end
    context '保存がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end
    context '保存がうまくいかないとき' do
      it '画像が空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像を入力してください')
      end
      it '商品名が空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明が空だと保存できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'カテゴリーが非選択状態だと保存できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態が非選択状態だと保存できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担が非選択状態だと保存できない' do
        @item.ship_charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '配送元の地域が非選択状態だと保存できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数が非選択状態だと保存できない' do
        @item.ship_preparation_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格が空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end
      it '価格が299円だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300~9,999,999の間で半角数字で入力してください')
      end
      it '価格が10000000だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300~9,999,999の間で半角数字で入力してください')
      end
      it '価格は半角数字以外だと登録できない' do
        @item.price = 'ああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300~9,999,999の間で半角数字で入力してください')
      end
    end
  end
end
