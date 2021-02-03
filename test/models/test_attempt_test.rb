# == Schema Information
#
# Table name: test_attempts
#
#  id         :integer          not null, primary key
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  test_id    :integer
#  user_id    :integer
#
# Foreign Keys
#
#  test_id  (test_id => tests.id)
#  user_id  (user_id => users.id)
#
require "test_helper"

class TestAttemptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
