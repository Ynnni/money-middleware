FactoryGirl.define do
  factory :account do
    name { Faker::Business.credit_card_number }
    currency
  end
end