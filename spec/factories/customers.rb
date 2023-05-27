FactoryBot.define do
  factory :customer do
    first_name { Faker::Name::first_name }
    last_name_string { Faker::Name::last_name }
    cpf { "MyString" }
  end
end
