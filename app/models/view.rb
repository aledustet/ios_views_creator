# == Schema Information
#
# Table name: views
#
#  id         :integer          not null, primary key
#  view_index :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class View < ActiveRecord::Base
  has_many :sections
  validates :view_index, presence: true
  validates :view_index, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
