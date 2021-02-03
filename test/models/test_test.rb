# == Schema Information
#
# Table name: tests
#
#  id            :integer          not null, primary key
#  name          :string
#  testable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  testable_id   :integer
#
# Indexes
#
#  index_tests_on_testable  (testable_type,testable_id)
#
require "test_helper"

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
