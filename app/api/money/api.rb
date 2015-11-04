module Money
  class API < Grape::API
    prefix :api
    format :json
    # formatter :json, Grape::Formatter::Rabl

    # authentication may be here
    mount Resources::AccountsAPI
    mount Resources::ExpensesAPI
    mount Resources::RevenuesAPI
    mount Resources::CategoriesAPI
    mount Resources::CurrenciesAPI
  end
end
