# == Schema Information
#
# Table name: balances
#
#  id          :integer          not null, primary key
#  total       :decimal(10, 2)   default(0.0)
#  account_id  :integer
#  currency_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Balance < ActiveRecord::Base
  belongs_to :account
  belongs_to :currency

  validates :currency, :account, presence: true
  validates :currency, uniqueness: { scope: :account }

  validates :total, presence: true
end
