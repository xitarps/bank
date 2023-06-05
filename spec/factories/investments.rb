FactoryBot.define do
  factory :investment do
    amount { Faker::Number.within(from: 1, to: 1000) }
    account { Account.all.any ? Account.all.sample : FactoryBot.create(:account) }
    product { Product.all.any? ? Product.all.sample : FactoryBot.create(:product) } 
  end
end
