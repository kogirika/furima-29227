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
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailが重複していると保存できないこと' do
        another_user = FactoryBot.create(:user)
        @user.email = another_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@がないと保存できないこと' do
        @user.email = 'hoge.hoge'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが６文字未満だと保存できないこと' do
        @user.password = '1234a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード英数字混合６文字以上で入力してください')
      end
      it 'passwordが数字だけだと保存できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード英数字混合６文字以上で入力してください')
      end
      it 'passwordが英字だけだと保存できないこと' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード英数字混合６文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'firstnameが空の場合は保存できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（姓）を入力してください')
      end
      it 'firstnameが全角以外だと保存できない' do
        @user.firstname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（姓）を全角で入力してください')
      end
      it 'lastnameが空の場合は保存できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'lastnameが全角以外だと保存できない' do
        @user.lastname = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を全角で入力してください')
      end
      it 'firstname_kanaが空の場合は保存できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（姓）カナを入力してください')
      end
      it 'firstname_kanaが全角カナ以外だと保存できない' do
        @user.firstname_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字（姓）カナを全角カナで入力してください')
      end
      it 'lastname_kanaが空の場合は保存できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを入力してください')
      end
      it 'lastname_kanaが全角カナ以外だと保存できない' do
        @user.lastname_kana = 'あああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを全角カナで入力してください')
      end
      it 'birthdayが空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end
    end
  end
end
