require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品を購入できる場合' do
      it '住所情報とカード情報を正しく入力すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品を購入できない場合' do
      it '郵便番号が空では購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank",
                                                               'Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が「3桁ハイフン4桁」でないと購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号が半角文字列でないと購入できない' do
        @order_address.postal_code = '１２３－４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が空では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank", 'Telephone number is invalid')
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.telephone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が12桁以上では購入できない' do
        @order_address.telephone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号が半角数字でないと購入できない' do
        @order_address.telephone_number = '１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'カード情報が空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        user = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
      it 'itemが紐付いていなければ購入できない' do
        item = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include()
      end
    end
  end
end
