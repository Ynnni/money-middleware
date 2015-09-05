require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create(:account) }
  it 'should have Plutus Account assigned' do
    binding.pry
    expect(account.plutus_account).to be_kind_of Plutus::Account
  end
end
