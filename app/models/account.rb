# == Schema Information
#
# Table name: accounts
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  currency_id       :integer
#  plutus_account_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Account < ActiveRecord::Base
  belongs_to :currency
  belongs_to :plutus_account, class_name: 'Plutus::Account'

  has_many :expenses
  has_many :revenues

  validates_presence_of :name
  validates_presence_of :currency
end
