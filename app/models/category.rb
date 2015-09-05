# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  type       :string(255)
#  parent_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  belongs_to :parent, class_name: self
  validates_presence_of :name
  validate :validate_parent_mismatch, if: :parent

  def validate_parent_mismatch
    return if parent.instance_of? self.class
    errors.add :parent, 'type mismatch'
  end
end
