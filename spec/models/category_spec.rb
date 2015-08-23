require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'income category may have a parent category' do
    category = create(:income_category_with_parent)
    expect(category.parent).to be
  end

  it 'expense category may have a parent category' do
    category = create(:expense_category_with_parent)
    expect(category.parent).to be
  end
end
