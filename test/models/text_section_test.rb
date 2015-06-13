# == Schema Information
#
# Table name: text_sections
#
#  id         :integer          not null, primary key
#  section_id :integer
#  content    :text
#  font       :string
#  font_size  :integer
#  scrollable :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  red        :integer
#  green      :integer
#  blue       :integer
#  alignment  :integer
#
# Indexes
#
#  index_text_sections_on_section_id  (section_id)
#

require 'test_helper'

class TextSectionTest < ActiveSupport::TestCase
  def setup
    @text_section = text_sections(:text_section)
  end

  test "haves a valid factory" do
    assert @text_section.valid?
  end

  test "correctly validates the required fields" do
    prev = @text_section.section
    @text_section.section = nil
    assert_not @text_section.valid?
    @text_section.section = prev
    prev = @text_section.content
    @text_section.content = nil
    assert_not @text_section.valid?
    @text_section.content = prev
    prev = @text_section.font
    @text_section.font = nil
    assert_not @text_section.valid?
    @text_section.font = prev
    prev = @text_section.font_size
    @text_section.font_size = nil
    assert_not @text_section.valid?
  end

  test "doesn't allow duplicate section values" do
    text_sec = text_sections(:other_text_section)
    text_sec.section = @text_section.section
    assert_not text_sec.valid?
  end
end
