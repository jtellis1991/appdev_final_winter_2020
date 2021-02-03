# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  body        :text
#  difficulty  :string
#  image       :string
#  prompt      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  official_id :string
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
