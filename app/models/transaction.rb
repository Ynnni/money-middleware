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

class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :currency

  validates :account, :currency, presence: true

  validates :amount, numericality: { greater_than: 0 }
  validates :date, :amount, presence: true
end
