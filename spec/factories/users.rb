FactoryBot.define do
  factory :user do
    email { "#{Faker::Internet.user_name}@raro.com" }
    password { 123_456 }
    userable { FactoryBot.build(:customer) }
  end

  trait :confirmed do
    confirmed_at { DateTime.current }
  end

  trait :root do
    userable { FactoryBot.build(:root) }
  end

  trait :administrator do
    userable { FactoryBot.build(:administrator) }
  end
end
