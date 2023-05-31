FactoryBot.define do
  factory :user do
    email { 'argonauta@raro.com' }
    password { 123_456 }
    userable { FactoryBot.build(:customer) }
  end

  trait :confirmed do
    confirmed_at { DateTime.current }
  end
end
