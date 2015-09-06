# == Schema Information
#
# Table name: accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Account < ActiveRecord::Base
  has_many :expenses
  has_many :revenues

  validates_presence_of :name

  def balance
    revenues.sum(:amount) - expenses.sum(:amount)
  end
end
