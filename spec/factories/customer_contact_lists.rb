FactoryBot.define do
  factory :customer_contact_list do
    contact_list { ContactList.first || FactoryBot.create(:contact_list) }
    customer { FactoryBot.create(:customer) }
  end
end
