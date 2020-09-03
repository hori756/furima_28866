class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show,:edit,:update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end

  def show
  end

  def edit
    render :show unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
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
  def set_item
    @item = Item.find(params[:id])
  end
