FactoryBot.define do
  factory :product do
    name { Faker::Commerce.unique.product_name }
    start_date { Faker::Date.between(from: Time.zone.today, to: '2023-12-31') }
    final_date { Faker::Date.between(from: Date.tomorrow, to: '2023-12-31') }
    minimum_amount { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
    tax { Tax.all.any? ? Tax.all.sample : FactoryBot.create(:tax) }
  end
end
