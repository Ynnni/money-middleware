FactoryGirl.define do
  factory :transaction do
    amount { Faker::Number.decimal 3 }
    date { Date.today }
    notice { Faker::Lorem.sentence }

    account
    currency

    factory :income, class: :Income do
      association :category, factory: :income_category
    end

    factory :expense, class: :Expense do
      association :category, factory: :expense_category
    end
  end
end