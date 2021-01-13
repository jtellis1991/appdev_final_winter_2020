# == Schema Information
#
# Table name: questions
#
#  id                 :integer          not null, primary key
#  A                  :string
#  B                  :string
#  C                  :string
#  D                  :string
#  answer_explanation :text
#  answer_value       :string
#  prompt             :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_id        :string
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
