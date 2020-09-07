class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    # 出品者は出品した商品の購入画面のURLへ遷移しようとするとトップページへ遷移する
    redirect_to root_path if current_user.id == @item.user_id
    # 購入済み商品の購入画面のURLへ遷移しようとするとトップページへ遷移する
    redirect_to root_path if @item.purchase.present?
    @purchase = PurchaseDestination.new
  end

  def create
    @purchase = PurchaseDestination.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path(@item.user_id)
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def purchase_params
    params.permit(
      :item_id,
      :purchase_id,
      :token,
      :post_code,
      :prefecture_id,
      :city,
      :address,
      :build_name,
      :phone_number
    )
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
