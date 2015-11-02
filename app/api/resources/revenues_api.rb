module Resources
  class RevenuesAPI < Grape::API
    resource :revenues do
      get do
        Revenue.all
      end

      post do
        Revenue.create(params[:revenue])
      end

      get ':id' do
        Revenue.find(params[:id])
      end

      patch ':id' do
        revenue = Revenue.find(params[:id])
        revenue.update params[:revenue]
        revenue
      end

      delete ':id' do
        revenue = Revenue.find(params[:id])
        revenue.destroy
      end
    end
  end
end
