FactoryBot.define do
  factory :purchase_destination do
    token { 'test' }
    post_code { '000-0000' }
    prefecture_id { 7 }
    city { 'テスト' }
    address { '1-1' }
    phone_number { '09012345678' }
  end
end
