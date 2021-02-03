# == Schema Information
#
# Table name: answers
#
#  id             :integer          not null, primary key
#  correct_answer :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  question_id    :integer
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
