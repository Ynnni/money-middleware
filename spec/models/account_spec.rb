require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'balances should invalid if they are not unique in account scope' do
    account = build(:account) do |account|
      2.times { account.balances.build attributes_for(:balance) }
    end
    expect { account.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
