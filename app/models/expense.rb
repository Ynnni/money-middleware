# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  currency_id :integer
#  amount      :decimal(20, 10)
#  date        :date
#  description :string(255)
#  account_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Expense < Transaction
  belongs_to :category, class_name: 'ExpenseCategory'
  validates_presence_of :category

  after_save :decrease_account_balance

  def decrease_account_balance
    account.balance(currency).decrement! :balance, amount
  end
end
