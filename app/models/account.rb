# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  has_many :balances
  has_many :expenses
  has_many :incomes

  validates :title, presence:  true

  def increase_balance(amount, currency)
    balance = balance currency
    balance.increment! :total, amount
  end

  def decrease_balance(amount, currency)
    balance = balance currency
    balance.decrement! :total, amount
  end

  def balance(currency)
    balances.find_or_create_by currency: currency
  end
end
