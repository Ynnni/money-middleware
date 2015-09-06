# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  type        :string(255)
#  amount      :decimal(20, 10)
#  date        :date
#  description :string(255)
#  category_id :integer
#  account_id  :integer
#  currency_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Transaction < ActiveRecord::Base
  # abstract class
  belongs_to :account
  belongs_to :currency
  validates_presence_of :amount, :date, :description
  validates_presence_of :account, :currency
end
