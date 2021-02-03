# == Schema Information
#
# Table name: choices
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  option_id   :integer
#  response_id :integer
#
# Foreign Keys
#
#  option_id    (option_id => options.id)
#  response_id  (response_id => responses.id)
#
require "test_helper"

class ChoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
