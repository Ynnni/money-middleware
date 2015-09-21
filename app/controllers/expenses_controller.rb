class ExpensesController < ApplicationController
  respond_to :json

  def index
    @expenses = Expense.all
    respond_with @expenses
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit :account_id, :currency_id, :category_id, :amount, :date, :description
  end
end
