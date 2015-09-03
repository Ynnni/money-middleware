FactoryGirl.define do
  factory :category do
    name { Faker::Lorem.word }

    factory :expense_category, class: :ExpenseCategory do
      factory :expense_category_with_parent, class: :ExpenseCategory do
        association :parent, factory: :expense_category
      end
    end

    factory :revenue_category, class: :RevenueCategory do
      factory :revenue_category_with_parent, class: :RevenueCategory do
        association :parent, factory: :revenue_category
      end
    end
  end
end