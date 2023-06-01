FactoryBot.define do
  factory :administrator do
    name { Faker::Name.first_name }
  end
end
