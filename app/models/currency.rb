# == Schema Information
#
# Table name: currencies
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  code       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Currency < ActiveRecord::Base

end
