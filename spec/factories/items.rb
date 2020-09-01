FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'test' }
    category_id { 1 }
    status_id { 1 }
    postage_payer_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }
    price { 10000 }
    association :user
  end
end
