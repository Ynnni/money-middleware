module Resources
  class ExpensesAPI < Grape::API
    resource :expenses do
      get do
        Expense.all
      end

      post do
        Expense.create(params[:expense])
      end

      get ':id' do
        Expense.find(params[:id])
      end

      patch ':id' do
        expense = Expense.find(params[:id])
        expense.update params[:expense]
        expense
      end

      delete ':id' do
        expense = Expense.find(params[:id])
        expense.destroy
      end
    end
  end
end
