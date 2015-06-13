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
end
