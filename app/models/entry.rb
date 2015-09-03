# == Schema Information
#
# Table name: entries
#
#  id              :integer          not null, primary key
#  type            :string(255)
#  account_id      :integer
#  currency_id     :integer
#  category_id     :integer
#  plutus_entry_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Entry < ActiveRecord::Base
  belongs_to :account
  belongs_to :currency
  belongs_to :plutus_entry, class_name: 'Plutus::Entry'

  validates_presence_of :account, :currency
end
