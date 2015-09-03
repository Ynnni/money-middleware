# == Schema Information
#
# Table name: currencies
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  code          :string(255)
#  exchange_rate :decimal(20, 10)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Currency < ActiveRecord::Base
  validates_presence_of :title, :code, :exchange_rate
end
