class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseDestination.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path(@item.user_id)
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = "sk_test_1d5eb400ef09731178f12296"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
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
            :phone_number,
          )
          .merge(user_id: current_user.id)
  end
end