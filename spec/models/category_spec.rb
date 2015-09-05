require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }
  let(:revenue_category) { build(:revenue_category) }
  it 'parent class and self class should be equal' do
    category.parent = revenue_category
    expect { category.save! }.to raise_error ActiveRecord::RecordInvalid
  end
end
