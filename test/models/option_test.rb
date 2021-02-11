# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  correct     :boolean
#  value       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#
# Foreign Keys
#
#  question_id  (question_id => questions.id)
#
require "test_helper"

class OptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
