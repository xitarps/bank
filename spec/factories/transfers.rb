FactoryBot.define do
  factory :transfer do
    amount { '9.99' }
    status { 1 }
    trade_date { '2023-06-04' }
  end
end
