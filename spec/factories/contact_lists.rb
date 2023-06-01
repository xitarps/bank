FactoryBot.define do
  factory :contact_list do
    customer { Customer.first || FactoryBot.create(:customer) }
  end
end
