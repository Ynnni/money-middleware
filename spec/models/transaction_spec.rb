require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context Income do
    let(:income) { build(:income) }

    it 'balance must be' do
      income.save
      expect(income.account.balance(income.currency)).to be
    end

    it 'balance must be increased' do
      income.save
      expect(income.account.balance(income.currency).total).to eq income.amount
    end
  end

  context Expense do
    let(:expense) { build(:expense) }

    it 'balance must be' do
      expense.save
      expect(expense.account.balance(expense.currency)).to be
    end

    it 'balance must be decreased' do
      expense.save
      expect(expense.account.balance(expense.currency).total).to eq -expense.amount
    end
  end
end
