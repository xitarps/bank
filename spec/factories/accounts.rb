FactoryBot.define do
  factory :account do
    amount { '9.99' }
    Customer { FactoryBot.create(:customer) }
  end
end
