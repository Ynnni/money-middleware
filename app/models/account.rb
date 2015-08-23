class Account < ActiveRecord::Base
  has_many :balances
  has_many :expenses
  has_many :incomes
end
