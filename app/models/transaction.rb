class Transaction < ActiveRecord::Base
  belongs_to :category
  belongs_to :account
  belongs_to :currency
end
