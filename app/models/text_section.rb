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
  belongs_to :section
  validates :section, :content, presence: true
  validates :section, uniqueness: true
  validates :red, :green, :blue, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 255 }
  validates :font_size, numericality: { only_integer: true, greater_than_or_equal_to: 1}
  validates :alignment, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  after_initialize :init

  def init
    self.font  ||= "Helvetica"
    self.font_size ||= 12
    self.red ||= 0
    self.green ||= 0
    self.blue ||= 0
    self.alignment ||= 0
    self.scrollable ||= false
  end
end
