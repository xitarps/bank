FactoryBot.define do
  factory :tax do
    name { Faker::Ancient.god }
    value { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
