module Money
  class API < Grape::API
    format :json
    prefix :api

    resource :accounts do
      desc 'Return all accounts'
      get do
        Account.all
      end

      desc 'Create a new account'
      post do
        Account.create(params[:account])
      end
    end

    resource :currencies do
      desc 'Return all currencies'
      get do
        Currency.all
      end
    end

    resource :categories do
      desc 'Return all expense currencies'
      get '/expense'do
        ExpenseCategory.all
      end

      desc 'Return all expense currencies'
      get '/revenue'do
        RevenueCategory.all
      end
    end

  end
end
