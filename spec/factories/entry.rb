FactoryGirl.define do
  factory :entry do
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