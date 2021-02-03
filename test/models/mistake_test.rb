# == Schema Information
#
# Table name: mistakes
#
#  id               :integer          not null, primary key
#  erroneous_answer :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  question_id      :integer
#  root_cause_id    :integer
#
require "test_helper"

class MistakeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
