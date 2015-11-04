module Resources
  class CurrenciesAPI < Grape::API
    resource :currencies do
      get do
        Currency.all
      end
    end
  end
end
