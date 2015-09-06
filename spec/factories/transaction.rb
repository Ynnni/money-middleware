FactoryGirl.define do
  factory :transaction do
    amount { Faker::Number.decimal(2) }
    date { Date.today }
    description { Faker::Lorem.sentence }

    account
    currency

    factory :revenue, class: :Revenue do
      association :category, factory: :revenue_category
    end

    factory :expense, class: :Expense do
      association :category, factory: :expense_category
    end
  end
end