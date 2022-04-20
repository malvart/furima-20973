require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'ユーザー情報を正しく入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        
      end
      it 'emailが空では登録できない' do
      end
      it 'emailが既に存在すると登録できない' do
      end
      it 'emailに@がないと登録できない' do
      end
      it 'passwordが空では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
      end
      it 'passwordに半角英数字以外の文字があると登録できない' do
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
      end
      it 'first_nameが空では登録できない' do
      end
      it 'last_nameが空では登録できない' do
      end
      it 'kana_first_nameが空では登録できない' do
      end
      it 'kana_last_nameが空では登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end
