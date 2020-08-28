FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'fff666' }
    password_confirmation { password }
    first_name            { '太郎' }
    family_name { '田中' }
    first_name_kana { 'タロウ' }
    family_name_kana        { 'タナカ' }
    birth_date              { '2010/3/15' }
  end
end
