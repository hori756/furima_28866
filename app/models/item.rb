class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many_attached :images
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :user
    validates :name
    validates :description
    validates :images
    validates :category
    validates :status
    validates :postage_payer
    validates :prefecture
    validates :shipping_day
    validates :price
  end
  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_day_id
  end
end
