FactoryBot.define do
  factory :tax do
    name { Faker::Name.unique.first_name }
    value { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
