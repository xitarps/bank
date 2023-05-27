FactoryBot.define do
  factory :customer do
    first_name { Faker::Name::first_name }
    last_name { Faker::Name::last_name }
    cpf { Faker::IDNumber.brazilian_citizen_number }
  end
end
