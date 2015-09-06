# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  has_many :expenses
  has_many :revenues
  has_many :balances

  validates_presence_of :name

  def balance(currency)
    balances.find_or_create_by currency_id: currency.id
  end
end
