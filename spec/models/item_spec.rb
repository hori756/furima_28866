require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品を出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
    context '新規登録がうまくいくとき' do
      it '登録できること' do
        expect(@item).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it '写真がないと登録出来ない' do
        @item.images = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Images can't be blank")
      end
      it '名前がないと登録出来ない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリーの記述がないと登録出来ない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品の状態の記述がないと登録出来ない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it '配送料の負担の記述がないと登録出来ない' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 0')
      end
      it '発送元の地域の記述がないと登録出来ない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送までの日数の記述がないと登録出来ない' do
        @item.shipping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 0')
      end
      it '販売価格の記述がないと登録出来ない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格の記述が300未満でないと登録出来ない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格の記述が9,999,999ないと登録出来ない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '販売価格の記述が半角数字でないと登録出来ない' do
        @item.price = '１０００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
