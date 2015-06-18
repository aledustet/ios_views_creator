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

require 'test_helper'

class SectionTest < ActiveSupport::TestCase

  def setup
    @section_image = sections(:section_for_image)
    @section_text = sections(:section_for_text)
  end

  test "haves a valid factory" do
    assert @section_text.valid?
    assert @section_image.valid?
  end


  test "does'nt allow nil values" do
    @section_text.x = nil
    assert_not @section_text.valid?
    @section_text.x = @section_image.x
    @section_text.y = nil
    assert_not @section_text.valid?
    @section_text.y = @section_image.y
    @section_text.width = nil
    assert_not @section_text.valid?
    @section_text.width = @section_image.width
    @section_text.height = nil
    assert_not @section_text.valid?
    @section_text.height = @section_image.height
    @section_text.view = nil
    assert_not @section_text.valid?
    @section_text.view = views(:view)
    @section_text.section_type = nil
    assert_not @section_text.valid?
    @section_text.section_type = @section_image.section_type
    @section_text.section_index = nil
    assert_not @section_text.valid?
  end

  test "validates x correctly" do
    @section_text.x = -1
    assert_not @section_text.valid?
  end

  test "validates y correctly" do
    @section_text.y = -1
    assert_not @section_text.valid?
  end

  test "validates width correctly" do
    @section_text.width = 0
    assert_not @section_text.valid?
  end

  test "validates height correctly" do
    @section_text.height = 0
    assert_not @section_text.valid?
  end

  test "validates section_type correctly" do
    @section_text.section_type = -1
    assert_not @section_text.valid?
  end

  test "validates section_index correctly" do
    @section_text.section_index = -1
    assert_not @section_text.valid?
  end

  test "a minion object exists on the right table" do
    text_section = TextSection.find_by_section_id(@section_text.id)
    image_section = ImageSection.find_by_section_id(@section_text.id)
    assert (!text_section.nil? and image_section.nil?)
  end

end
