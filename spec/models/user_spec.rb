require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'userの保存' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると保存できないこと' do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@がないと保存できないこと' do
        @user.email = "hoge.hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email メールアドレスを入力してください")
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが６文字未満だと保存できないこと' do
        @user.password = "1234a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが数字だけだと保存できないこと' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字混合６文字以上で入力してください")
      end
      it 'passwordが英字だけだと保存できないこと' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 英数字混合６文字以上で入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      end
      it 'firstnameが空の場合は保存できない' do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'firstnameが全角以外だと保存できない' do
        @user.firstname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname 全角で入力してください")
      end
      it 'lastnameが空の場合は保存できない' do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'lastnameが全角以外だと保存できない' do
        @user.lastname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname 全角で入力してください")
      end
      it 'firstname_kanaが空の場合は保存できない' do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it 'firstname_kanaが全角カナ以外だと保存できない' do
        @user.firstname_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana 全角カナで入力してください")
      end
      it 'lastname_kanaが空の場合は保存できない' do
        @user.lastname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end
      it 'lastname_kanaが全角カナ以外だと保存できない' do
        @user.lastname_kana = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana 全角カナで入力してください")
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end   
  end
end
