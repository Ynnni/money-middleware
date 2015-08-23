class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :currency

  validates :account, :currency, :category, presence: true

  validates :amount, numericality: { greater_than: 0 }
  validates :date, :amount, presence: true
end
