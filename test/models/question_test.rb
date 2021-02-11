# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  body        :text
#  difficulty  :integer
#  image       :string
#  prompt      :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  official_id :string
#  style_id    :integer
#  test_id     :integer
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#  style_id     (style_id => styles.id)
#  test_id      (test_id => tests.id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
