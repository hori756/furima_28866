class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end

def item_params
  params.require(:item)
        .permit(
          :name,
          :description,
          :category_id,
          :status_id,
          :postage_payer_id,
          :prefecture_id,
          :shipping_day_id,
          :price,
          :images
        )
        .merge(user_id: current_user.id)
end
