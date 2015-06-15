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

require 'test_helper'

class ImageSectionTest < ActiveSupport::TestCase

  def setup
    @image_section = image_sections(:image_section)
  end

  test "haves a valid factory" do
    assert @image_section.valid?
  end

  test "doesn't allow nil values" do
    prev = @image_section.section
    @image_section.section = nil
    assert_not @image_section.valid?
  end

  test "doesn't allow duplicate section values" do
    other = image_sections(:other_image_section)
    other.section = @image_section.section
    assert_not other.valid?
  end

end
