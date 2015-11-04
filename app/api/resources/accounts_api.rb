module Resources
  class AccountsAPI < Grape::API
    resource :accounts do
      desc 'Return all accounts'
      get do
        Account.all
      end

      # get '/options', rabl: 'accounts/options' do
      #   @accounts = Account.all
      # end

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
  end
end
