# == Schema Information
#
# Table name: responses
#
#  id                   :integer          not null, primary key
#  milliseconds_elapsed :integer
#  text_submitted       :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  question_id          :integer
#  test_attempt_id      :integer
#  user_id              :integer
#
# Foreign Keys
#
#  question_id      (question_id => questions.id)
#  test_attempt_id  (test_attempt_id => test_attempts.id)
#  user_id          (user_id => users.id)
#
require "test_helper"

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
