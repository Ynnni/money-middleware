module Money
  class API < Grape::API
    format :json
    prefix :api

    resource :accounts do
      desc 'Return all accounts'
      get do
        Account.all
      end

      desc 'Create new account'
      post do
        Account.create(params[:account])
      end

      desc 'Show account'
      get ':id' do
        Account.find(params[:id])
      end

      desc 'Update account'
      patch ':id' do
        account = Account.find(params[:id])
        account.update(params[:account])
        account
      end

      desc 'Delete account'
      delete ':id' do
        account = Account.find(params[:id])
        account.destroy
        account
      end
    end

    # resource :currencies do
    #   desc 'Return all currencies'
    #   get do
    #     Currency.all
    #   end
    # end
    #
    # resource :categories do
    #   desc 'Return all expense currencies'
    #   get '/expense'do
    #     ExpenseCategory.all
    #   end
    #
    #   desc 'Return all expense currencies'
    #   get '/revenue'do
    #     RevenueCategory.all
    #   end
    # end

  end
end
