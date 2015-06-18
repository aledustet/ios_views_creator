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
  end

  test "correctly validates colors" do
    prev = @text_section.section
    @text_section.red = 256
    assert_not @text_section.valid?
    @text_section.section = prev
    prev = @text_section.content
    @text_section.blue = -1
    assert_not @text_section.valid?
  end

  test "correctly validates font_size" do
    @text_section.font_size = 0
    assert_not @text_section.valid?
  end

  test "correctly validates alignment" do
    @text_section.alignment = -1
    assert_not @text_section.valid?
  end

  test "doesn't allow duplicate section values" do
    text_sec = text_sections(:other_text_section)
    text_sec.section = @text_section.section
    assert_not text_sec.valid?
  end

  test "initializes the omited values with defaults" do
    text_section = text_sections(:uninitialized_text_section)
    assert (text_section.font_size == 12)
  end
end
