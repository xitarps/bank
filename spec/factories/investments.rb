FactoryBot.define do
  factory :investment do
    amount { Faker::Number.within(range: 1..10_000) }
    account { FactoryBot.create(:account) }
    product { Product.all.any? ? Product.all.sample : FactoryBot.create(:product) }
  end
end
