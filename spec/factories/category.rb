FactoryGirl.define do
  factory :category do
    title { Faker::Lorem.word }

    factory :expense_category, class: :ExpenseCategory do
      factory :expense_category_with_parent, class: :ExpenseCategory do
        association :parent, factory: :expense_category
      end
    end

    factory :income_category, class: :IncomeCategory do
      factory :income_category_with_parent, class: :IncomeCategory do
        association :parent, factory: :income_category
      end
    end
  end
end