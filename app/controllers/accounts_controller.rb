class AccountsController < ApplicationController
  respond_to :json

  def index
    @accounts = Account.all
    respond_with @accounts
  end

  def create
    @account = Account.create account_params
    respond_with @account
  end

  def update
    @account = Account.find params[:id]
    @account.update account_params
    respond_with @account do |format|
      format.json do
        if @account.valid?
          render json: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @account = Account.find params[:id]
    @account.destroy
    respond_with @account
  end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
