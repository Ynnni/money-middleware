module Money
  class API < Grape::API
    format :json
    prefix :api

    # authentication may be here
    mount Resources::AccountsAPI
    mount Resources::ExpensesAPI
    mount Resources::RevenuesAPI
  end
end
