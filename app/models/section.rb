# == Schema Information
#
# Table name: sections
#
#  id            :integer          not null, primary key
#  view_id       :integer
#  section_index :integer
#  x             :integer
#  y             :integer
#  width         :integer
#  height        :integer
#  section_type  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_sections_on_view_id  (view_id)
#

class Section < ActiveRecord::Base
end
