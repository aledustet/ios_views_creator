# == Schema Information
#
# Table name: image_sections
#
#  id         :integer          not null, primary key
#  section_id :integer
#  image_name :string
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_image_sections_on_section_id  (section_id)
#

class ImageSection < ActiveRecord::Base
end
