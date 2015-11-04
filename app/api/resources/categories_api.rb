module Resources
  class CategoriesAPI < Grape::API
    resource :categories do
      resource :expenses do
        get do
          ExpenseCategory.all
        end
      end
    end
  end
end
