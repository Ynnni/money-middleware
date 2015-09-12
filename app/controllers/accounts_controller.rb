class AccountsController < ApplicationController
  respond_to :html, :json

  def create
    @account = Account.create account_params
    respond_with @account
  end

  def index
    @accounts = Account.all
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
