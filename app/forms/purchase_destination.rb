class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :build_name, :phone_number,
                :purchase_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0}
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{,11}\z/}
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Destination.create(
      post_code: post_code, prefecture_id: prefecture_id,
      city: city, address: address, build_name: build_name,
      phone_number: phone_number, purchase_id: purchase.id
    )
  end
end
