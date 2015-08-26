# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  amount      :decimal(10, 2)   default(0.0)
#  date        :date
#  notice      :string(255)
#  type        :string(255)
#  account_id  :integer
#  currency_id :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Expense < Transaction
  belongs_to :category, class_name: 'ExpenseCategory'
  validates :category, presence: true
end
