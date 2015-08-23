FactoryGirl.define do
  factory :account do
    title { Faker::Business.credit_card_number }
  end
end