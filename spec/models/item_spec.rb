require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品を出品できる場合' do
      it '商品情報を正しく入力すれば出品できる' do
        attach_image
        expect(@item).to be_valid
      end
    end
    context '商品を出品できない場合(imageなし)' do
      it 'imageが空では出品できない' do
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
    context '商品を出品できない場合(imageあり)' do
      before do
        attach_image
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では出品できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空では出品できない' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'chargeが空では出品できない' do
        @item.charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_dayが空では出品できない' do
        @item.shipping_day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが300以下では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが9,999,999以上では出品できない' do
        @item.price = 12345678
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end

  private
  def attach_image
    @item.image = fixture_file_upload('app/assets/images/icon_camera.png')
  end

end
