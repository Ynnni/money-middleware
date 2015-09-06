# == Schema Information
#
# Table name: balances
#
#  id          :integer          not null, primary key
#  balance     :decimal(20, 10)  default(0.0)
#  account_id  :integer
#  currency_id :integer
#

class Balance < ActiveRecord::Base
  belongs_to :account
  belongs_to :currency

  validates_presence_of :account, :currency
end
