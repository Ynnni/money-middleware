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

class Income < Transaction
  belongs_to :category, class_name: 'IncomeCategory'

  validates :category, presence: true

  before_save :increase_account_balance

  def increase_account_balance
    account.increase_balance amount, currency
  end
end
