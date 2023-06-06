FactoryBot.define do
  factory :customer_class do
    customer { Customer.first || FactoryBot.create(:customer) }
    classroom { Classroom.first || FactoryBot.create(:classroom) }
  end
end
