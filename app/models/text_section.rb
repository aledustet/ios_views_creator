# == Schema Information
#
# Table name: text_sections
#
#  id         :integer          not null, primary key
#  section_id :integer
#  content    :text
#  font       :string
#  font_size  :integer
#  red        :integer
#  green      :integer
#  blue       :integer
#  alignment  :integer
#  scrollable :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_text_sections_on_section_id  (section_id)
#

class TextSection < ActiveRecord::Base
end
