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
  # HACK: class_name must be string, this implementation don't validate type mismatch
  belongs_to :plutus_account, class_name: Plutus::Account

  has_many :expenses
  has_many :revenues

  validates_presence_of :name
  validates_presence_of :currency

  after_create :assign_plutus_account

  def assign_plutus_account
    self.reload
    self.plutus_account = Plutus::Asset.new name: code
    self.save
  end

  def code
    "#{name[0..2].upcase}-#{currency.code.upcase}-#{id}"
  end
end
