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
  has_many :image_sections
  has_many :text_sections
  belongs_to :view
  validates :x, :y, :width, :height, :section_type, :view, presence: true
  validates :x, :y, :section_index, :section_type, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :width, :height, numericality: { only_integer: true, greater_than: 0 }
end
