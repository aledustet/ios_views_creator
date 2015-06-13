# == Schema Information
#
# Table name: views
#
#  id         :integer          not null, primary key
#  view_index :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ViewTest < ActiveSupport::TestCase

  def setup
    @view = views(:view)
  end

  test "haves a valid fixture" do
    assert @view.valid?
  end

  test "haves a 'valid' invalid fixture" do
    assert_not view(:view_invalid).valid?
  end

  test "haves it's sections" do
    assert (@view.sections.count == 5)
  end

end
