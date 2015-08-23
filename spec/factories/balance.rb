FactoryGirl.define do
  factory :balance, aliases: [:dollar_balance] do
    total { Faker::Number.decimal(2) }
    association :account, factory: :account ,strategy: :build

    association :currency, factory: :dollar, strategy: :build

    factory :hrivna_balance do
      association :currency, factory: :hrivna, strategy: :build
    end
  end
end