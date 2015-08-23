class Balance < ActiveRecord::Base
  belongs_to :account
  belongs_to :currency

  validates :currency, :account, presence: true
  validates :currency, uniqueness: { scope: :account }

  validates :total, presence: true
end
