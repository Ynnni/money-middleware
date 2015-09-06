# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { build(:account) }
  it 'revenue should increase account balance' do
    revenue = build(:revenue, amount: 100, account: account)
    expect { revenue.save }.to change { account.balance }.from(0).to(100)
  end

  it 'expense should increase account balance' do
    expense = build(:expense, amount: 100, account: account)
    expect { expense.save }.to change { account.balance }.from(0).to(-100)
  end
end
