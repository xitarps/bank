FactoryBot.define do
  factory :user do
    email { 'argonauta@raro.com' }
    password { 123456 }
    userable { FactoryBot.build(:customer) }
  end
end
