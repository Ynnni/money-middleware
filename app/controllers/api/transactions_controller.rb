module Api
  class TransactionsController < ApplicationController
    before_action :find_category, only: [:create, :show, :update, :destroy]
    before_action :find_transaction, only: [:show, :update, :destroy]

    respond_to :json

    def index
      @transactions = Transaction.all.joins(:category).where categories: { id: params[:category_id] }
      respond_with @transactions
    end

    def create
      @transaction = @category.transactions.create transaction_params
      respond_with :api, @category, @transaction
    end

    def show
      respond_with @transaction
    end

    def update
      @transaction.update transaction_params
      respond_with @transaction
    end

    def destroy
      @transaction.destroy
      respond_with @transaction
    end

    private
    def find_category
      @category = Category.find params[:category_id]
    end

    def find_transaction
      @transaction = @category.transactions.find params[:id]
    end

    def transaction_params
      params.require(:transaction).permit :title, :amount, :description
    end
  end
end
