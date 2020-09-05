require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '商品購入' do
    before do
      @purchase_destination = FactoryBot.build(:purchase_destination)
    end
    context '購入できる時' do
      it '全部正しい入力' do
        expect(@purchase_destination).to be_valid
      end
    end
    context '購入出来ない時' do
      it 'トークンが取得できない' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:token]).to include('can\'t be blank')
      end
      it '郵便番号がないと購入できない' do
        @purchase_destination.post_code = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:post_code]).to include('can\'t be blank')
      end
      it '郵便番号にハイフンがないとと購入できない' do
        @purchase_destination.post_code = 0000000
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:post_code]).to include('is invalid')
      end
      it '都道府県が選択されていないと購入できない' do
        @purchase_destination.prefecture_id = 0
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:prefecture_id]).to include('must be other than 0')
      end
      it '市区町村がないと購入できない' do
        @purchase_destination.city  = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:city]).to include('can\'t be blank')
      end
      it '住所がないと購入できない' do
        @purchase_destination.address  = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:address]).to include('can\'t be blank')
      end
      it '電話番号がないと購入できない' do
        @purchase_destination.phone_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:phone_number]).to include('can\'t be blank')
      end
      it '電話番号にハイフンがあると購入できない' do
        @purchase_destination.phone_number = 000-0000-1234
        @purchase_destination.valid?
        expect(@purchase_destination.errors[:phone_number]).to include('is invalid')
      end
    end
  end
end