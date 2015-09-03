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

class Revenue < Entry
  belongs_to :category, class_name: 'RevenueCategory'
  validates_presence_of :category
end
